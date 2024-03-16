// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:muslimpocket/commons/global.dart';
// import 'package:muslimpocket/firebase_auth_implementation/firebase_auth_services.dart';
// import 'package:muslimpocket/widgets/wrapper_widget.dart';

class FormWidget extends StatefulWidget {
  final Function()? onSaveName;
  const FormWidget({super.key, this.onSaveName});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
//   // final TextEditingController newPrayer = TextEditingController();
//   // String hasil = "";

  @override
  Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;

    return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 10,
//           ),
//           child: TextField(
//             autofocus: true,
//             keyboardType: TextInputType.text,
//             cursorColor: Global().greenPrimary,
//             autocorrect: false,
//             onChanged: (value) {
//               setState(() {
//                 hasil = value;
//               });
//             },
//             decoration: InputDecoration(
//               labelText: "Nama",
//               labelStyle: TextStyle(
//                 color: Global().greenPrimary,
//               ),
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: Global().greenPrimary,
//                   width: 2,
//                 ),
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(10),
//                 ),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: Global().greenPrimary,
//                 ),
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(10),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         const Row(
//           children: [
//             Icon(Icons.replay),
//             Text('Frekuensi Waktu'),
//           ],
//         ),
//         const Row(children: [
//           Icon(Icons.radio_button_checked_rounded),
//           Text('Setiap hari')
//         ]),
//         Row(
//           children: [
//             Container(
//               height: height * .07,
//               width: width * .3,
//               decoration: BoxDecoration(
//                 color: Global().bgBlur,
//               ),
//               child: WrapperWidget(
//                 builder: (user) {
//                   if (user == null) {
//                     return InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const LoginOrRegister(),
//                           ),
//                         );
//                       },
//                       child: const Text("Login"),
//                     );
//                   }
//                   DateTime date = DateTime.now();
//                   return Container(
//                     decoration: BoxDecoration(
//                       color: Global().bgBlur,
//                     ),
//                     child: Center(
//                       child:
//                           StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//                         stream: FirebaseFirestore.instance
//                             .collection("trackers")
//                             .doc(
//                                 "${user.uid}-${date.year}${date.month}${date.day}")
//                             .snapshots(),
//                         builder: (_, snapshot) {
//                           DocumentSnapshot<Map<String, dynamic>> doc =
//                               snapshot.data!;
//                           return InkWell(
//                             onTap: () {
//                               List<bool> value = [];
//                               List<String> valueTitle = [];
//                               try {
//                                 value = List<bool>.from(
//                                     doc.data()!['udahChecklists']);
//                                 valueTitle = List<String>.from(
//                                     doc.data()!['checklists']);
//                               } catch (e) {
//                                 print(e);
//                                 value = List.generate(
//                                     doc.data()!['checklists'].length,
//                                     (index) => false);
//                                 valueTitle = List<String>.from(
//                                     doc.data()!['checklists']);
//                               }
//                               print(value.length);

//                               value.add(false);
//                               valueTitle.add(hasil);

//                               doc.reference.update(
//                                 {
//                                   "udahChecklists": value,
//                                   "checklists": valueTitle,
//                                 },
//                               );
//                             },
//                             child: Container(
//                               width: width * .25,
//                               height: height * .035,
//                               decoration: BoxDecoration(
//                                 color: Global().greenPrimary,
//                                 borderRadius: BorderRadius.circular(30.0),
//                               ),
//                               child: ElevatedButton(
//                                 style: ButtonStyle(
//                                   backgroundColor:
//                                       MaterialStateProperty.all<Color>(
//                                           Global().greenPrimary),
//                                 ),
//                                 onPressed: widget.onSaveName,
//                                 child: Text(
//                                   'Simpan',
//                                   style: TextStyle(
//                                     color: Global().white,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ],
    );
  }
}
