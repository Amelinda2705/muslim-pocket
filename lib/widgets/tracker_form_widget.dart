import 'package:flutter/material.dart';
import 'package:muslimpocket/commons/global.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final TextEditingController newPrayer = TextEditingController();
  String? hasil;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: TextField(
            autofocus: true,
            keyboardType: TextInputType.text,
            cursorColor: Global().greenPrimary,
            autocorrect: false,
            onChanged: (value) {
              print(value);
              setState(() {
                hasil = value;
              });
            },
            decoration: InputDecoration(
              labelText: "Nama",
              labelStyle: TextStyle(
                color: Global().greenPrimary,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Global().greenPrimary,
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Global().greenPrimary,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ),
        const Row(
          children: [
            Icon(Icons.replay),
            Text('Frekuensi Waktu'),
          ],
        ),
        const Row(children: [
          Icon(Icons.radio_button_checked_rounded),
          Text('Setiap hari')
        ]),
        Container(
          width: width * .25,
          height: height * .035,
          margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          decoration: BoxDecoration(
              color: Global().greenPrimary,
              borderRadius: BorderRadius.circular(30.0)),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Global().greenPrimary),
            ),
            onPressed: () {
              
            },
            child: Text(
              'Simpan',
              style: TextStyle(
                color: Global().white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
