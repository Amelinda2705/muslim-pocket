import 'package:flutter/material.dart';
import 'package:muslimpocket/commons/global.dart';
import 'package:muslimpocket/screens/profile/profile_screen.dart';
import 'package:muslimpocket/screens/quran/quran_screen.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
import 'package:colorful_iconify_flutter/icons/emojione.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:muslimpocket/widgets/calender_widget.dart';
import 'package:muslimpocket/widgets/prayer_widget.dart';
import 'package:muslimpocket/widgets/tasbih_widget.dart';
import 'package:muslimpocket/widgets/tracker_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 32.0),
                      child: const Column(
                        children: [
                          Column(
                            children: [
                              PrayerWidget(),
                              SizedBox(
                                height: 30.0,
                              ),
                            ],
                          ),
                          Expanded(
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
                height: 80,
                width: width,
                child: TabBar(
                    indicatorColor: Global().greenPrimary,
                    labelColor: Global().greenPrimary,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 13),
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
      case 'kalender':
        return const KalenderSection();
      default:
        return const TrackerSection();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: Global().bgBlur, borderRadius: BorderRadius.circular(21.0)),
        child: Column(
          children: [
            Container(
              width: 325.0,
              height: 43.0,
              decoration: BoxDecoration(
                  color: Global().bgBlur,
                  borderRadius: BorderRadius.circular(21.0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
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
                        child: const Text('Tracker')),
                    ElevatedButton(
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
                        child: const Text('Tasbih')),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentSection = 'kalender';
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (currentSection == 'kalender') {
                                return Global().greenPrimary;
                              }
                              return Global().bgBlur;
                            },
                          ),
                          foregroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (currentSection == 'kalender') {
                                return Global().white;
                              }
                              return Colors.black;
                            },
                          ),
                        ),
                        child: const Text('Kalender')),
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


class TrackerPage extends StatelessWidget {
  const TrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/chevron-kiri.png'),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: Global().greenPrimary,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '26',
                        style: TextStyle(
                          color: Global().white,
                          fontSize: 13,
                          fontWeight: Global().medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: Global().bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '27',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: Global().medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: Global().bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '28',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: Global().medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: Global().bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '29',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: Global().medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: Global().bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '30',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: Global().medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: Global().bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '31',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: Global().medium,
                        ),
                      ),
                    ],
                  )),
              Image.asset('assets/images/chevron-right.png'),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              width: 237.0,
              height: 34.0,
              margin: const EdgeInsets.only(top: 5.0),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Global().bgDone,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Subuh',
                      style: TextStyle(
                        fontWeight: Global().medium,
                      ),
                    ),
                    Image.asset(
                      'assets/images/edit.png',
                      width: 15.0,
                      height: 12.0,
                    )
                  ]),
            ),
            Container(
              width: 237.0,
              height: 34.0,
              margin: const EdgeInsets.only(top: 5.0),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Global().bgDone,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Zuhur',
                      style: TextStyle(
                        fontWeight: Global().medium,
                      ),
                    ),
                    Image.asset(
                      'assets/images/edit.png',
                      width: 15.0,
                      height: 12.0,
                    )
                  ]),
            ),
            Container(
              width: 237.0,
              height: 34.0,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.only(top: 5.0),
              decoration: BoxDecoration(
                  color: Global().bgNotYet,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Asar',
                      style: TextStyle(
                        fontWeight: Global().medium,
                      ),
                    ),
                    Image.asset(
                      'assets/images/edit.png',
                      width: 15.0,
                      height: 12.0,
                    )
                  ]),
            ),
            Container(
              width: 237.0,
              height: 34.0,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.only(top: 5.0),
              decoration: BoxDecoration(
                  color: Global().bgNotYet,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Magrib',
                      style: TextStyle(
                        fontWeight: Global().medium,
                      ),
                    ),
                    Image.asset(
                      'assets/images/edit.png',
                      width: 15.0,
                      height: 12.0,
                    )
                  ]),
            ),
            Container(
              width: 237.0,
              height: 34.0,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.only(top: 5.0),
              decoration: BoxDecoration(
                  color: Global().bgNotYet,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Isya',
                      style: TextStyle(
                        fontWeight: Global().medium,
                      ),
                    ),
                    Image.asset(
                      'assets/images/edit.png',
                      width: 15.0,
                      height: 12.0,
                    )
                  ]),
            ),
          ],
        ),
      ],
    );
  }
}

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/chevron-kiri.png'),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: Global().greenPrimary,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '26',
                        style: TextStyle(
                          color: Global().white,
                          fontSize: 13,
                          fontWeight: Global().medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: Global().bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '27',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: Global().medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: Global().bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '28',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: Global().medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: Global().bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '29',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: Global().medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: Global().bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '30',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: Global().medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: Global().bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '31',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: Global().medium,
                        ),
                      ),
                    ],
                  )),
              Image.asset('assets/images/chevron-right.png'),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              width: 237.0,
              height: 34.0,
              margin: const EdgeInsets.only(top: 5.0),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Global().bgDone,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Subuh',
                      style: TextStyle(
                        fontWeight: Global().medium,
                      ),
                    ),
                    Image.asset('assets/images/done.png')
                  ]),
            ),
            Container(
              width: 237.0,
              height: 34.0,
              margin: const EdgeInsets.only(top: 5.0),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Global().bgDone,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Zuhur',
                      style: TextStyle(
                        fontWeight: Global().medium,
                      ),
                    ),
                    Image.asset('assets/images/done.png')
                  ]),
            ),
            Container(
              width: 237.0,
              height: 34.0,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.only(top: 5.0),
              decoration: BoxDecoration(
                  color: Global().bgNotYet,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Asar',
                      style: TextStyle(
                        fontWeight: Global().medium,
                      ),
                    ),
                    Image.asset('assets/images/not-yet.png')
                  ]),
            ),
            Container(
              width: 237.0,
              height: 34.0,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.only(top: 5.0),
              decoration: BoxDecoration(
                  color: Global().bgNotYet,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Magrib',
                      style: TextStyle(
                        fontWeight: Global().medium,
                      ),
                    ),
                    Image.asset('assets/images/not-yet.png')
                  ]),
            ),
            Container(
              width: 237.0,
              height: 34.0,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.only(top: 5.0),
              decoration: BoxDecoration(
                  color: Global().bgNotYet,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Isya',
                      style: TextStyle(
                        fontWeight: Global().medium,
                      ),
                    ),
                    Image.asset('assets/images/not-yet.png')
                  ]),
            ),
          ],
        ),
      ],
    );
  }
}
