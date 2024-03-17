// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:muslimpocket/commons/global.dart';
// import 'package:muslimpocket/firebase_auth_implementation/firebase_auth_services.dart';
// import 'package:muslimpocket/widgets/wrapper_widget.dart';

// class TrackerScreen extends StatefulWidget {
//   const TrackerScreen({super.key});

//   @override
//   State<TrackerScreen> createState() => _TrackerScreenState();
// }

// class _TrackerScreenState extends State<TrackerScreen> {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return SafeArea(
//       child: WrapperWidget(
//         builder: (user) {
//           if (user == null) {
//             return InkWell(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (_) => const LoginOrRegister()),
//                 );
//               },
//               child: const Text("Login"),
//             );
//           }
//           DateTime date = DateTime.now();
//           return Center(
//             child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//               stream: FirebaseFirestore.instance
//                   .collection("trackers")
//                   .doc("${user.uid}-${date.year}${date.month}${date.day}")
//                   .snapshots(),
//               builder: (_, snapshot) {
//                 if (!snapshot.hasData) {
//                   return const Text("Loading");
//                 }
//                 if (snapshot.data == null || snapshot.data!.data() == null) {
//                   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//                     FirebaseFirestore.instance
//                         .collection("trackers")
//                         .doc("${user.uid}-${date.year}${date.month}${date.day}")
//                         .set({
//                       "userId": user.uid,
//                       "createdAt": FieldValue.serverTimestamp(),
//                       "checklists": [
//                         "Subuh",
//                         "Zuhur",
//                         "Asar",
//                         "Magrib",
//                         "Isya",
//                       ]
//                     });
//                   });
//                   return const Text("Tidak ada data");
//                   // Bikin data disini
//                 }
//                 DocumentSnapshot<Map<String, dynamic>> doc = snapshot.data!;
//                 return Column(
//                   children: [
//                     Text(user.uid),
//                     Text(doc.id),
//                     Column(
//                       children: List.generate(doc.data()!['checklists'].length,
//                           (index) {
//                         String value = doc.data()!['checklists'][index];
//                         bool isCheck = false;
//                         try {
//                           isCheck = doc.data()!['udahChecklists'][index];
//                         } catch (e) {}
//                         return GestureDetector(
//                           onTap: () {
//                             List<bool> value = [];
//                             try {
//                               value = List<bool>.from(
//                                   doc.data()!['udahChecklists']);
//                             } catch (e) {
//                               print(e);
//                               value = List.generate(
//                                   doc.data()!['checklists'].length,
//                                   (index) => false);
//                             }
//                             value[index] = !isCheck;
//                             doc.reference
//                                 .update({"udahChecklists": value, "asdh": ""});
//                           },
//                           child: Container(
//                             width: width * .6,
//                             height: height * .04,
//                             margin: const EdgeInsets.only(top: 5.0),
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 20.0,
//                             ),
//                             decoration: BoxDecoration(
//                               color: Global().bgDone,
//                               borderRadius: BorderRadius.circular(30.0),
//                             ),
//                             child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: <Widget>[
//                                   Expanded(
//                                       child: Text(
//                                     value,
//                                     style: TextStyle(
//                                       fontWeight: Global().medium,
//                                     ),
//                                   )),
//                                   FaIcon(
//                                     isCheck
//                                         ? FontAwesomeIcons.solidCircleCheck
//                                         : FontAwesomeIcons.circle,
//                                   ),
//                                 ]),
//                           ),
//                         );
//                       }),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         List<bool> value = [];
//                         List<String> valueTitle = [];
//                         try {
//                           value =
//                               List<bool>.from(doc.data()!['udahChecklists']);
//                           valueTitle =
//                               List<String>.from(doc.data()!['checklists']);
//                         } catch (e) {
//                           print(e);
//                           value = List.generate(
//                               doc.data()!['checklists'].length,
//                               (index) => false);
//                           valueTitle =
//                               List<String>.from(doc.data()!['checklists']);
//                         }
//                         print(value.length);

//                         value.add(false);
//                         valueTitle.add("Gimana User");

//                         doc.reference.update({
//                           "udahChecklists": value,
//                           "checklists": valueTitle
//                         });
//                       },
//                       child: const Text("Tambah"),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => const LoginOrRegister()));
//                       },
//                       child: const Text("Login"),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
