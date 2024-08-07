import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:muslimpocket/commons/global.dart';
import 'package:muslimpocket/widgets/wrapper_widget.dart';

class EditWidget extends StatefulWidget {
  final Function()? onBack;
  final Function()? onSave;
  final Function()? onShowForm;
  const EditWidget({super.key, this.onBack, this.onSave, this.onShowForm});

  @override
  State<EditWidget> createState() => _EditWidgetState();
}

class _EditWidgetState extends State<EditWidget> {
  late DateTime currDate;

  @override
  void initState() {
    currDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return WrapperWidget(
      builder: (user) {
        if (user == null) {
          return Container();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                                  height: height * .05,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Global().bgNotYet,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        value.day.toString(),
                                        style: TextStyle(
                                          fontWeight: Global().semiBold,
                                        ),
                                      ),
                                      Text(
                                        DateFormat("MMM").format(value),
                                        style: const TextStyle(
                                          fontSize: 12,
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
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: Global().bold,
                                  fontSize: 16,
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
                                  height: height * .05,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Global().bgNotYet,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        currDate
                                            .add(Duration(days: (index + 1)))
                                            .day
                                            .toString(),
                                        style: TextStyle(
                                          fontWeight: Global().semiBold,
                                        ),
                                      ),
                                      Text(
                                        DateFormat("MMM").format(currDate
                                            .add(Duration(days: (index + 1)))),
                                        style: const TextStyle(
                                          fontSize: 12,
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
                    if (snapshot.data == null ||
                        snapshot.data!.data() == null) {
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
                          children: List.generate(
                              doc.data()!['checklists'].length, (index) {
                            String value = doc.data()!['checklists'][index];
                            bool isCheck = false;
                            try {
                              isCheck = doc.data()!['udahChecklists'][index];
                            } catch (e) {}
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Container(
                                width: width * .64,
                                height: height * .04,
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
                                                doc
                                                    .data()!['checklists']
                                                    .length,
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
                                        child: FaIcon(
                                          FontAwesomeIcons.trash,
                                          size: width * .04,
                                        ),
                                      ),
                                    ]),
                              ),
                            );
                          }),
                        ),
                        GestureDetector(
                          onTap: widget.onShowForm,
                          child: Container(
                            width: width * .64,
                            height: height * .04,
                            margin: const EdgeInsets.only(top: 5.0),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            decoration: BoxDecoration(
                              color: Global().greenPrimary,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.plus,
                                size: width * .05,
                                color: Global().white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: width * .25,
                  height: height * .035,
                  margin: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                      color: Global().greenPrimary,
                      borderRadius: BorderRadius.circular(30.0)),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Global().greenPrimary),
                    ),
                    onPressed: widget.onBack,
                    child: Text(
                      'Kembali',
                      style: TextStyle(
                        color: Global().white,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: width * .25,
                  height: height * .035,
                  margin: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                      color: Global().greenPrimary,
                      borderRadius: BorderRadius.circular(30.0)),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Global().greenPrimary),
                    ),
                    onPressed: widget.onSave,
                    child: Text(
                      'Simpan',
                      style: TextStyle(
                        color: Global().white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
