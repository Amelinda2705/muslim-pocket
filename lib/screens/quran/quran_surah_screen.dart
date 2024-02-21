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
      child: Container(
        decoration: const BoxDecoration(
          color: bgBlur,
        ),
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    height: 120,
                    width: width,
                    child: Column(
                      children: [
                        Text(surah["name_latin"],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: semiBold,
                            )),
                        Text(surah["translations"]["id"]["name"],
                            style: const TextStyle(
                                fontSize: 12, fontWeight: light)),
                        Container(
                            decoration: const BoxDecoration(
                              color: greenPrimary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 5),
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              "${surah["number_of_ayah"]} ayat",
                              style: const TextStyle(
                                  color: white, fontWeight: semiBold),
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 70),
                        width: 325,
                        child: Column(
                          children: List.generate(
                              int.parse(surah["number_of_ayah"]), (index) {
                            return Container(
                              width: width,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              decoration: const BoxDecoration(
                                  border: Border(bottom: BorderSide())),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    surah["text"]["${index + 1}"],
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: bold,
                                      fontFamily: 'IsepMisbah',
                                      height: 2.0
                                    ),
                                  ),
                                  Text(
                                    surah["transliteration"]["${index + 1}"],
                                    style: const TextStyle(
                                      color: greenPrimary,
                                    ),
                                  ),
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
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 10, left: 10, right: 20, bottom: 13),
                  decoration: const BoxDecoration(
                    color: greenPrimary,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(50)),
                  ),
                  child: Column(
                    children: [
                      Text(
                        surah["number"],
                        style: const TextStyle(
                            color: white, fontSize: 16, fontWeight: semiBold),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 10, right: 10, left: 20, bottom: 13),
                    decoration: const BoxDecoration(
                      color: greenPrimary,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(50)),
                    ),
                    child: const Icon(
                      Icons.close,
                      color: white,
                    ),
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
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 10, right: 30, top: 13),
                      decoration: const BoxDecoration(
                        color: greenPrimary,
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(50)),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.keyboard_arrow_left_rounded, color: white),
                          Text(
                            "sebelumnya",
                            style: TextStyle(
                                color: white,
                                fontSize: 14,
                                fontWeight: semiBold),
                          ),
                        ],
                      ),
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
                      padding: const EdgeInsets.only(
                          bottom: 10, right: 10, left: 30, top: 13),
                      decoration: const BoxDecoration(
                        color: greenPrimary,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(50)),
                      ),
                      child: const Row(
                        children: [
                          Text("selanjutnya",
                              style: TextStyle(
                                  color: white,
                                  fontSize: 14,
                                  fontWeight: semiBold)),
                          Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    ));
  }
}
