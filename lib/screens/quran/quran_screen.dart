import 'package:flutter/material.dart';
import 'package:muslimpocket/resources/datas/quran_data.dart';
import 'package:muslimpocket/commons/global.dart';
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
        title: const Text(
          'Al-Quran',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Center(
        child: Container(
          width: 325,
          height: height,
          decoration: BoxDecoration(
            color: Global().bgBlur,
            borderRadius: const BorderRadius.all(const Radius.circular(10)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          margin: const EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            child: Column(
                children: List.generate(quranData.length, (index) {
              Map<String, dynamic> surah = quranData[index]["${index + 1}"];
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => QuranSurahScreen(index)));
                },
                child: Container(
                  height: 70,
                  width: width,
                  decoration: const BoxDecoration(
                      border: Border(
                    bottom: BorderSide(),
                  )),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Stack(children: [
                          Image.asset(
                            'assets/images/number-surah.png',
                          ),
                          Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Center(
                                child: Text(
                                  surah["number"],
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: Global().semiBold,
                                      color: Global().greenPrimary),
                                ),
                              ))
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              surah["name_latin"],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: Global().semiBold),
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                "${surah["translations"]["id"]["name"]} | ${surah["number_of_ayah"]} ayat",
                                style: const TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })),
          ),
        ),
      ),
    );
  }
}
