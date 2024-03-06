import 'package:flutter/material.dart';
import 'package:muslimpocket/commons/global.dart';
import 'package:muslimpocket/screens/home/home_screen.dart';

class TrackerSection extends StatefulWidget {
  const TrackerSection({super.key});

  @override
  State<TrackerSection> createState() => _TrackerSectionState();
}

class _TrackerSectionState extends State<TrackerSection> {
  bool edit = false;

  Widget getContentWidget() {
    if (edit) {
      return const TrackerPage();
    } else {
      return const EditPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        getContentWidget(),
        Container(
            width: 95.0,
            height: 26.0,
            margin:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            decoration: BoxDecoration(
                color: Global().greenPrimary,
                borderRadius: BorderRadius.circular(30.0)),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Global().greenPrimary)),
              onPressed: () {
                setState(() {
                  edit = true;
                });
              },
              child: Text('Edit',
                  style: TextStyle(color: Global().white, fontSize: 12)),
            ))
      ],
    );
  }
}