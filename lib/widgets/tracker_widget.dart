import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:muslimpocket/commons/global.dart';
import 'package:muslimpocket/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:muslimpocket/screens/profile/log_in.dart';
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
            showEdit = true;
            showForm = false;
            print(showEdit);
            setState(() {});
          },
          onBack: () {
            showEdit = true;
            showForm = false;
            print(showEdit);
            setState(() {});
          },
        );
      }
      return EditWidget(
        onBack: () {
          showEdit = false;
          print(showEdit);
          setState(() {});
        },
        onSave: () {
          showEdit = false;
          print(showEdit);
          setState(() {});
        },
        onShowForm: () {
          showForm = true;
          print(showEdit);
          setState(() {});
        },
      );
    }
    return TrackerWidget(
      onShowEdit: () {
        showEdit = true;
        showForm = false;
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
          return Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: width,
                    height: 60,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 8,
                            ),
                            child: Container(
                              width: width * .1,
                              height: height * .055,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "1",
                                  ),
                                  Text(
                                    "Jan",
                                    style: TextStyle(
                                        // color: Colors.white,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 8,
                            ),
                            child: Container(
                              width: width * .1,
                              height: height * .055,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "1",
                                  ),
                                  Text(
                                    "Jan",
                                    style: TextStyle(
                                        // color: Colors.white,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: width * .1,
                            height: height * .055,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Global().greenPrimary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "3",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Jan",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                            ),
                            child: Container(
                              width: width * .1,
                              height: height * .055,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "4",
                                    style: TextStyle(
                                        // color: Colors.white,
                                        ),
                                  ),
                                  Text(
                                    "Jan",
                                    style: TextStyle(
                                        // color: Colors.white,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                            ),
                            child: Container(
                              width: width * .1,
                              height: height * .055,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "4",
                                    style: TextStyle(
                                        // color: Colors.white,
                                        ),
                                  ),
                                  Text(
                                    "Jan",
                                    style: TextStyle(
                                        // color: Colors.white,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: [
                      Column(children: [
                        Padding(
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
                              color: Global().bgNotYet,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                      child: Text(
                                    "Subuh",
                                    style: TextStyle(
                                      fontWeight: Global().medium,
                                    ),
                                  )),
                                  const FaIcon(
                                    FontAwesomeIcons.circle,
                                  ),
                                ]),
                          ),
                        ),
                        Padding(
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
                              color: Global().bgNotYet,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                      child: Text(
                                    "Zuhur",
                                    style: TextStyle(
                                      fontWeight: Global().medium,
                                    ),
                                  )),
                                  const FaIcon(
                                    FontAwesomeIcons.circle,
                                  ),
                                ]),
                          ),
                        ),
                        Padding(
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
                              color: Global().bgNotYet,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                      child: Text(
                                    "Asar",
                                    style: TextStyle(
                                      fontWeight: Global().medium,
                                    ),
                                  )),
                                  const FaIcon(
                                    FontAwesomeIcons.circle,
                                  ),
                                ]),
                          ),
                        ),
                        Padding(
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
                              color: Global().bgNotYet,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                      child: Text(
                                    "Magrib",
                                    style: TextStyle(
                                      fontWeight: Global().medium,
                                    ),
                                  )),
                                  const FaIcon(
                                    FontAwesomeIcons.circle,
                                  ),
                                ]),
                          ),
                        ),
                        Padding(
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
                              color: Global().bgNotYet,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                      child: Text(
                                    "Isya",
                                    style: TextStyle(
                                      fontWeight: Global().medium,
                                    ),
                                  )),
                                  const FaIcon(
                                    FontAwesomeIcons.circle,
                                  ),
                                ]),
                          ),
                        ),
                      ]),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
              ClipRect(
                child: Container(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 3.0,
                      sigmaY: 3.0,
                    ),
                    child: Container(
                      height: height * .36,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "login");
                        },
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FaIcon(FontAwesomeIcons.lock),
                            SizedBox(
                              height: height * .01,
                            ),
                            SizedBox(
                              width: width * .5,
                              child: Text(
                                "Masuk untuk membuka fitur ini.",
                                style: TextStyle(
                                  fontWeight: Global().medium,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: width * .25,
                              height: height * .035,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: Global().greenPrimary,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Global().greenPrimary),
                                ),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacement<void, void>(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          LoginPage(),
                                    ),
                                  );
                                },
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    'Masuk',
                                    style: TextStyle(
                                      color: Global().white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return Column(
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
                              height: height * .055,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Global().bgNotYet,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                              height: height * .055,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Global().bgNotYet,
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
                                    FaIcon(
                                      isCheck
                                          ? FontAwesomeIcons.solidCircleCheck
                                          : FontAwesomeIcons.circle,
                                      size: width * .05,
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
            Container(
              width: width * .25,
              height: height * .035,
              decoration: BoxDecoration(
                color: Global().greenPrimary,
                borderRadius: BorderRadius.circular(30.0),
              ),
              margin: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Global().greenPrimary),
                ),
                onPressed: widget.onShowEdit,
                child: Text(
                  'Edit',
                  style: TextStyle(
                    color: Global().white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
