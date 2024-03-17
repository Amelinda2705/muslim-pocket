import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:muslimpocket/commons/global.dart';
import 'package:muslimpocket/screens/profile/profile_screen.dart';
import 'package:muslimpocket/screens/quran/quran_screen.dart';
// import 'package:iconify_flutter/iconify_flutter.dart';
// import 'package:iconify_flutter/icons/zondicons.dart';
// import 'package:colorful_iconify_flutter/icons/emojione.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:muslimpocket/widgets/prayer_widget.dart';
import 'package:muslimpocket/widgets/tasbih_widget.dart';
import 'package:muslimpocket/widgets/tracker_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    const QuranScreen(),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: height * .03, horizontal: width * .08),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              const PrayerWidget(),
                              SizedBox(
                                height: height * .03,
                              ),
                            ],
                          ),
                          const Expanded(
                            child: SectionMenu(),
                          ),
                        ],
                      ),
                    ),
                    const ProfileScreen(),
                  ],
                ),
              ),
              SizedBox(
                height: height * .09,
                width: width,
                child: TabBar(
                    indicatorColor: Global().greenPrimary,
                    labelColor: Global().greenPrimary,
                    indicatorPadding:
                        EdgeInsets.symmetric(horizontal: height * .01),
                    tabs: const [
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: FaIcon(FontAwesomeIcons.bookQuran),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: FaIcon(FontAwesomeIcons.house),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: FaIcon(FontAwesomeIcons.solidUser),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionMenu extends StatefulWidget {
  const SectionMenu({super.key});

  @override
  State<SectionMenu> createState() => _SectionMenuState();
}

class _SectionMenuState extends State<SectionMenu> {
  String currentSection = 'tracker';

  Widget getContentWidget() {
    switch (currentSection) {
      case 'tracker':
        return const TrackerSection();
      case 'tasbih':
        return const TasbihSection();
      // case 'kalender':
      //   return const KalenderSection();
      default:
        return const TrackerSection();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Global().bgBlur,
          borderRadius: BorderRadius.circular(21.0),
        ),
        child: Column(
          children: [
            Container(
              height: height * .055,
              decoration: BoxDecoration(
                color: Global().bgBlur,
                borderRadius: BorderRadius.circular(21.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 4.0,
                  ), 
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: height * .001,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      width: width * .4,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentSection = 'tracker';
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (currentSection == 'tracker') {
                                return Global().greenPrimary;
                              }
                              return Global().bgBlur;
                            },
                          ),
                          foregroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (currentSection == 'tracker') {
                                return Global().white;
                              }
                              return Colors.black;
                            },
                          ),
                        ),
                        child: const Text('Tracker'),
                      ),
                    ),
                    SizedBox(
                      width: width * .4,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentSection = 'tasbih';
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (currentSection == 'tasbih') {
                                return Global().greenPrimary;
                              }
                              return Global().bgBlur;
                            },
                          ),
                          foregroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (currentSection == 'tasbih') {
                                return Global().white;
                              }
                              return Colors.black;
                            },
                          ),
                        ),
                        child: const Text('Tasbih'),
                      ),
                    ),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       setState(() {
                    //         currentSection = 'kalender';
                    //       });
                    //     },
                    //     style: ButtonStyle(
                    //       backgroundColor:
                    //           MaterialStateProperty.resolveWith<Color>(
                    //         (Set<MaterialState> states) {
                    //           if (currentSection == 'kalender') {
                    //             return Global().greenPrimary;
                    //           }
                    //           return Global().bgBlur;
                    //         },
                    //       ),
                    //       foregroundColor:
                    //           MaterialStateProperty.resolveWith<Color>(
                    //         (Set<MaterialState> states) {
                    //           if (currentSection == 'kalender') {
                    //             return Global().white;
                    //           }
                    //           return Colors.black;
                    //         },
                    //       ),
                    //     ),
                    //     child: const Text('Kalender')),
                  ],
                ),
              ),
            ),
            getContentWidget(),
          ],
        ),
      ),
    );
  }
}
