import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:muslimpocket/commons/global.dart';
import 'package:muslimpocket/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:muslimpocket/widgets/tracker_edit_widget.dart';
import 'package:muslimpocket/widgets/tracker_form_widget.dart';
import 'package:muslimpocket/widgets/wrapper_widget.dart';

class TrackerSection extends StatefulWidget {
  const TrackerSection({super.key});

  @override
  State<TrackerSection> createState() => _TrackerSectionState();
}

class _TrackerSectionState extends State<TrackerSection> {
  bool showEdit = false;
  bool showForm = false;

  @override
  Widget build(BuildContext context) {
    if (showEdit) {
      if (showForm) {
        return FormWidget(
          onSaveName: () {
            showEdit = !showEdit;
            print(showEdit);
            setState(() {});
          },
        );
      }
      return EditWidget(
        onBack: () {
          showEdit = !showEdit;
          print(showEdit);
          setState(() {});
        },
        onSave: () {
          showEdit = !showEdit;
          print(showEdit);
          setState(() {});
        },
        onShowForm: () {
          showForm = !showForm;
          print(showEdit);
          setState(() {});
        },
      );
    }
    return TrackerWidget(
      onShowEdit: () {
        showEdit = !showEdit;
        print(showEdit);
        setState(() {});
      },
    );
  }
}

class TrackerWidget extends StatefulWidget {
  final Function()? onShowEdit;
  TrackerWidget({super.key, this.onShowEdit});

  @override
  State<TrackerWidget> createState() => _TrackerWidgetState();
}

class _TrackerWidgetState extends State<TrackerWidget> {
  late DateTime currDate;

  @override
  void initState() {
    currDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return WrapperWidget(
      builder: (user) {
        if (user == null) {
          return Container(
            height: 100,
            width: width,
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "login");
              },
              child: const Text("Login/Daftar Akun"),
            ),
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: width,
              height: 60,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                scrollDirection: Axis.horizontal,
                child: Center(
                  child: Row(
                    children: [
                      Row(
                        children: List.generate(2, (index) {
                          return currDate.add(Duration(days: -(index + 1)));
                        }).reversed.map((value) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              right: 8,
                            ),
                            child: InkWell(
                              onTap: () {
                                currDate = value;
                                setState(() {});
                              },
                              child: Container(
                                width: width * .1,
                                height: height * .055,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      value.day.toString(),
                                    ),
                                    Text(
                                      DateFormat("MMM").format(value),
                                      style: const TextStyle(
                                          // color: Colors.white,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      Container(
                        width: width * .1,
                        height: height * .055,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Global().greenPrimary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              currDate.day.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              DateFormat("MMM").format(currDate),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: List.generate(2, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                            ),
                            child: InkWell(
                              onTap: () {
                                currDate =
                                    currDate.add(Duration(days: (index + 1)));
                                setState(() {});
                              },
                              child: Container(
                                width: width * .1,
                                height: height * .055,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      currDate
                                          .add(Duration(days: (index + 1)))
                                          .day
                                          .toString(),
                                      style: const TextStyle(
                                          // color: Colors.white,
                                          ),
                                    ),
                                    Text(
                                      DateFormat("MMM").format(currDate
                                          .add(Duration(days: (index + 1)))),
                                      style: const TextStyle(
                                          // color: Colors.white,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection("trackers")
                  .doc(
                      "${user.uid}-${currDate.year}${currDate.month}${currDate.day}")
                  .snapshots(),
              builder: (_, snapshot) {
                if (!snapshot.hasData) {
                  return Container(
                    width: width,
                    height: 100,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                }
                if (snapshot.data == null || snapshot.data!.data() == null) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    FirebaseFirestore.instance
                        .collection("trackers")
                        .doc(
                            "${user.uid}-${currDate.year}${currDate.month}${currDate.day}")
                        .set({
                      "userId": user.uid,
                      "createdAt": FieldValue.serverTimestamp(),
                      "checklists": [
                        "Subuh",
                        "Zuhur",
                        "Asar",
                        "Magrib",
                        "Isya",
                      ]
                    });
                  });
                  return const Text("Tidak ada data");
                  // Bikin data disini
                }
                DocumentSnapshot<Map<String, dynamic>> doc = snapshot.data!;
                // return Container();
                return Column(
                  children: [
                    Column(
                      children: List.generate(doc.data()!['checklists'].length,
                          (index) {
                        String value = doc.data()!['checklists'][index];
                        bool isCheck = false;
                        try {
                          isCheck = doc.data()!['udahChecklists'][index];
                        } catch (e) {}
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: GestureDetector(
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
                              doc.reference.update({"udahChecklists": value});
                            },
                            child: Container(
                              width: width,
                              height: 50,
                              margin: const EdgeInsets.only(top: 5.0),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              decoration: BoxDecoration(
                                color: isCheck
                                    ? Global().bgDone
                                    : Global().bgNotYet,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                        child: Text(
                                      value,
                                      style: TextStyle(
                                        fontWeight: Global().medium,
                                      ),
                                    )),
                                    FaIcon(
                                      isCheck
                                          ? FontAwesomeIcons.solidCircleCheck
                                          : FontAwesomeIcons.circle,
                                    ),
                                  ]),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        );
      },
    );
  }
}
