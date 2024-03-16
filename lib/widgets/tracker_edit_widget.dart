import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:muslimpocket/commons/global.dart';
import 'package:muslimpocket/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:muslimpocket/widgets/wrapper_widget.dart';

class EditWidget extends StatelessWidget {
  final Function()? onBack;
  final Function()? onSave;
  final Function()? onShowForm;
  const EditWidget({super.key, this.onBack, this.onSave, this.onShowForm});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/chevron-kiri.png'),
              Container(
                width: 32.0,
                height: 32.0,
                decoration: BoxDecoration(
                    color: Global().greenPrimary,
                    borderRadius: BorderRadius.circular(50.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '26',
                      style: TextStyle(
                        color: Global().white,
                        fontSize: 13,
                        fontWeight: Global().medium,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: Global().bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '27',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: Global().medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: Global().bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '28',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: Global().medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: Global().bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '29',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: Global().medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: Global().bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '30',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: Global().medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: Global().bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '31',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: Global().medium,
                        ),
                      ),
                    ],
                  )),
              Image.asset('assets/images/chevron-right.png'),
            ],
          ),
        ),
        SizedBox(
          height: height * .3,
          width: width * 07,
          child: WrapperWidget(
            builder: (user) {
              if (user == null) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const LoginOrRegister()),
                    );
                  },
                  child: const Text("Login"),
                );
              }
              DateTime date = DateTime.now();
              return Container(
                color: Global().bgBlur,
                child: Column(
                  children: [
                    Center(
                      child:
                          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                        stream: FirebaseFirestore.instance
                            .collection("trackers")
                            .doc(
                                "${user.uid}-${date.year}${date.month}${date.day}")
                            .snapshots(),
                        builder: (_, snapshot) {
                          double width = MediaQuery.of(context).size.width;
                          double height = MediaQuery.of(context).size.height;

                          if (!snapshot.hasData) {
                            return const Text("Loading");
                          }
                          if (snapshot.data == null ||
                              snapshot.data!.data() == null) {
                            WidgetsBinding.instance
                                .addPostFrameCallback((timeStamp) {
                              FirebaseFirestore.instance
                                  .collection("trackers")
                                  .doc(
                                      "${user.uid}-${date.year}${date.month}${date.day}")
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
                          DocumentSnapshot<Map<String, dynamic>> doc =
                              snapshot.data!;
                          return Column(
                            children: List.generate(
                                doc.data()!['checklists'].length, (index) {
                              String value = doc.data()!['checklists'][index];
                              bool isCheck = false;
                              try {
                                isCheck = doc.data()!['udahChecklists'][index];
                              } catch (e) {}
                              return Column(
                                children: [
                                  GestureDetector(
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
                                      doc.reference.update({
                                        "udahChecklists": value,
                                        "asdh": ""
                                      });
                                    },
                                    child: Container(
                                      width: width * .6,
                                      height: height * .04,
                                      margin: const EdgeInsets.only(top: 5.0),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Global().bgDone,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
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
                                              FontAwesomeIcons.bars,
                                              size: width * .05,
                                            ),
                                          ]),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          );
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: onShowForm,
                      child: Container(
                        width: width * .6,
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
                    )
                  ],
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: width * .25,
              height: height * .035,
              margin:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Global().greenPrimary,
                  borderRadius: BorderRadius.circular(30.0)),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Global().greenPrimary),
                ),
                onPressed: onBack,
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
              margin:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Global().greenPrimary,
                  borderRadius: BorderRadius.circular(30.0)),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Global().greenPrimary),
                ),
                onPressed: onSave,
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
  }
}