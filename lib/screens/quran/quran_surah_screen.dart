import 'package:flutter/material.dart';
import 'package:muslimpocket/resources/datas/quran_data.dart';
import 'package:muslimpocket/screens/global.dart';

class QuranSurahScreen extends StatelessWidget {
  final int index;
  const QuranSurahScreen(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Map<String, dynamic> surah = quranData[index]["${index + 1}"];

    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 100,
                  width: width,
                  child: Column(
                    children: [
                      Text(surah["name_latin"]),
                      Text(surah["translations"]["id"]["name"]),
                      Text("${surah["number_of_ayah"]} ayat"),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: List.generate(
                            int.parse(surah["number_of_ayah"]), (index) {
                          return Container(
                            width: width,
                            decoration: const BoxDecoration(
                                border: Border(bottom: BorderSide())),
                            child: Column(
                              children: [
                                Text(surah["text"]["${index + 1}"]),
                                Text(surah["translations"]["id"]["text"]
                                    ["${index + 1}"]),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(color: greenPrimary),
              child: Text(surah["number"]),
            ),
            Positioned(
              right: 0,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(color: greenPrimary),
                  child: const Icon(Icons.close),
                ),
              ),
            ),
            if (index > 0)
              Positioned(
                bottom: 0,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => QuranSurahScreen(index - 1)));
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: const BoxDecoration(color: greenPrimary),
                    child: const Text("sebelumnya"),
                  ),
                ),
              ),
            if (index + 1 < quranData.length)
              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => QuranSurahScreen(index + 1)));
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: const BoxDecoration(color: greenPrimary),
                    child: const Text("selanjutnya"),
                  ),
                ),
              ),
          ],
        ),
      ),
    ));
  }
}
