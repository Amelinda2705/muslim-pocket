import 'package:flutter/material.dart';
import 'package:muslimpocket/resources/datas/quran_data.dart';
import 'package:muslimpocket/screens/quran/quran_surah_screen.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Al-Quran'),
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
              children: List.generate(quranData.length, (index) {
            Map<String, dynamic> surah = quranData[index]["${index + 1}"];
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => QuranSurahScreen(index)));
              },
              child: Container(
                height: 50,
                width: width,
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(),
                )),
                child: Row(
                  children: [
                    Text(surah["number"]),
                    Text(surah["name_latin"]),
                  ],
                ),
              ),
            );
          })),
        ),
      ),
    );
  }
}
