import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:muslimpocket/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:muslimpocket/widgets/wrapper_widget.dart';

class TrackerScreen extends StatefulWidget {
  const TrackerScreen({super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  @override
  Widget build(BuildContext context) {
    return WrapperWidget(
      builder: (user) {
        if (user == null) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LoginOrRegister()),
              );
            },
            child: const Text("Login"),
          );
        }
        DateTime date = DateTime.now();
        return Center(
          child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection("trackers")
                .doc("${user.uid}-${date.year}${date.month}${date.day}")
                .snapshots(),
            builder: (_, snapshot) {
              if (!snapshot.hasData) {
                return const Text("Loading");
              }
              if (snapshot.data == null || snapshot.data!.data() == null) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  FirebaseFirestore.instance
                      .collection("trackers")
                      .doc("${user.uid}-${date.year}${date.month}${date.day}")
                      .set({
                    "userId": user.uid,
                    "createdAt": FieldValue.serverTimestamp(),
                    "checklists": [
                      "Subuh",
                      "Dzuhur",
                      "asar",
                      "Marrib",
                      "Isa",
                    ]
                  });
                });
                return const Text("Tidak ada data");
                // Bikin data disini
              }
              DocumentSnapshot<Map<String, dynamic>> doc = snapshot.data!;
              return Container(
                child: Column(
                  children: [
                    Text(user.uid),
                    Text(doc.id),
                    Column(
                      children: List.generate(doc.data()!['checklists'].length,
                          (index) {
                        String value = doc.data()!['checklists'][index];
                        bool isCheck = false;
                        try {
                          isCheck = doc.data()!['udahChecklists'][index];
                        } catch (e) {}
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  List<bool> value = [];
                                  List<String> valueTitle = [];
                                  try {
                                    value = List<bool>.from(
                                        doc.data()!['udahChecklists']);
                                    valueTitle = List<String>.from(
                                        doc.data()!['checklists']);
                                  } catch (e) {
                                    print(e);
                                    value = List.generate(
                                        doc.data()!['checklists'].length,
                                        (index) => false);
                                    valueTitle = List<String>.from(
                                        doc.data()!['checklists']);
                                  }
                                  print(value.length);

                                  value.removeAt(index);
                                  valueTitle.removeAt(index);

                                  doc.reference.update({
                                    "udahChecklists": value,
                                    "checklists": valueTitle
                                  });
                                },
                                child: const Icon(
                                  Icons.close,
                                ),
                              ),
                              Expanded(child: Text('${value} - ${isCheck}')),
                              InkWell(
                                onTap: () {
                                  List<bool> value = [];
                                  try {
                                    value = List<bool>.from(
                                        doc.data()!['udahChecklists']);
                                  } catch (e) {
                                    print(e);
                                    value = List.generate(
                                        doc.data()!['checklists'].length,
                                        (index) => false);
                                  }
                                  value[index] = !isCheck;
                                  doc.reference.update(
                                      {"udahChecklists": value, "asdh": ""});
                                },
                                child: Icon(
                                  isCheck
                                      ? Icons.check_circle_outline_rounded
                                      : Icons.check_box_outline_blank_rounded,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    InkWell(
                      onTap: () {
                        List<bool> value = [];
                        List<String> valueTitle = [];
                        try {
                          value =
                              List<bool>.from(doc.data()!['udahChecklists']);
                          valueTitle =
                              List<String>.from(doc.data()!['checklists']);
                        } catch (e) {
                          print(e);
                          value = List.generate(
                              doc.data()!['checklists'].length,
                              (index) => false);
                          valueTitle =
                              List<String>.from(doc.data()!['checklists']);
                        }
                        print(value.length);

                        value.add(false);
                        valueTitle.add("Gimana User");

                        doc.reference.update({
                          "udahChecklists": value,
                          "checklists": valueTitle
                        });
                      },
                      child: const Text("Tambah"),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginOrRegister()));
                      },
                      child: const Text("Login"),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
