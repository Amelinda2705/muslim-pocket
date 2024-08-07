import 'package:flutter/material.dart';
import 'package:muslimpocket/resources/datas/quran_data.dart';
import 'package:muslimpocket/commons/global.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuranSurahScreen extends StatelessWidget {
  final int index;
  QuranSurahScreen(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Map<String, dynamic> surah = quranData[index]["${index + 1}"];

    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Global().bgBlur,
        ),
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: height * .02,
                    ),
                    // height: height * .13,
                    width: width,
                    child: Column(
                      children: [
                        Text(surah["name_latin"],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: Global().semiBold,
                            )),
                        Text(surah["translations"]["id"]["name"],
                            style: TextStyle(
                                fontSize: 12, fontWeight: Global().light)),
                        Container(
                          decoration: BoxDecoration(
                            color: Global().greenPrimary,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: width * .06, vertical: 5),
                          margin: const EdgeInsets.only(top: 10),
                          child: Text(
                            "${surah["number_of_ayah"]} ayat",
                            style: TextStyle(
                                color: Global().white,
                                fontWeight: Global().semiBold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(bottom: height * .08),
                        padding: EdgeInsets.symmetric(horizontal: width * .06),
                        width: width,
                        child: Column(
                          children: [
                            if (surah['withBasmalah'] != false)
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: Column(
                                  children: [
                                    Text(
                                      'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ',
                                      style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: Global().bold,
                                          fontFamily: 'IsepMisbah',
                                          height: 2.0),
                                      textAlign: TextAlign.right,
                                    ),
                                    Text(
                                      'bismillahir-rahmanir-rahim',
                                      style: TextStyle(
                                        color: Global().greenPrimary,
                                        fontSize: 15,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Container(
                                      width: width * .7,
                                      child: const Text(
                                        'Dengan nama Allah Yang Maha Pengasih, Maha Penyayang.',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            Column(
                              children: List.generate(
                                  int.parse(surah["number_of_ayah"]), (index) {
                                return Container(
                                  decoration: const BoxDecoration(
                                      border: Border(bottom: BorderSide())),
                                  padding: EdgeInsets.symmetric(
                                    vertical: height * .03,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: width * .08,
                                        height: width * .08,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Global().greenPrimary,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(20))),
                                        child: Center(
                                            child: Text(
                                          '${index + 1}',
                                          style: TextStyle(
                                            color: Global().greenPrimary,
                                          ),
                                        )),
                                      ),
                                      Container(
                                        width: width * .78,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              // ignore: prefer_interpolation_to_compose_strings
                                              surah["text"]["${index + 1}"].toString().contains("۩") ? surah["text"]["${index + 1}"]
                                                  .toString()
                                                  .replaceAll("۩", '')+
                      "\u202B" + '۩' :surah["text"]["${index + 1}"]
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: Global().bold,
                                                fontFamily: 'IsepMisbah',
                                                height: 2.0,
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                            Text(
                                              surah["transliteration"]
                                                  ["${index + 1}"],
                                              style: TextStyle(
                                                color: Global().greenPrimary,
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                            SizedBox(
                                              height: height * .01,
                                            ),
                                            Text(
                                              '${surah["translations"]["id"]["text"]["${index + 1}"]}',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ],
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
                  decoration: BoxDecoration(
                    color: Global().greenPrimary,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(50)),
                  ),
                  child: Column(
                    children: [
                      Text(
                        surah["number"],
                        style: TextStyle(
                            color: Global().white,
                            fontSize: 16,
                            fontWeight: Global().semiBold),
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
                    decoration: BoxDecoration(
                      color: Global().greenPrimary,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                      ),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Global().white,
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
                      decoration: BoxDecoration(
                        color: Global().greenPrimary,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(50)),
                      ),
                      child: Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.chevronLeft,
                            color: Global().white,
                            size: 13,
                          ),
                          SizedBox(
                            width: width * .02,
                          ),
                          Text(
                            "sebelumnya",
                            style: TextStyle(
                                color: Global().white,
                                fontSize: 14,
                                fontWeight: Global().semiBold),
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
                      decoration: BoxDecoration(
                        color: Global().greenPrimary,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50)),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "selanjutnya",
                            style: TextStyle(
                              color: Global().white,
                              fontSize: 14,
                              fontWeight: Global().semiBold,
                            ),
                          ),
                          SizedBox(
                            width: width * .02,
                          ),
                          FaIcon(
                            FontAwesomeIcons.chevronRight,
                            color: Global().white,
                            size: 13,
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
