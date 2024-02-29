import 'package:flutter/material.dart';
import 'package:muslimpocket/commons/global.dart';
import 'package:muslimpocket/screens/profile/profile_screen.dart';
import 'package:muslimpocket/screens/quran/quran_screen.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
import 'package:colorful_iconify_flutter/icons/emojione.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:muslimpocket/widgets/prayer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    const String bookQuran = '<svg xmlns="http://www.w3.org/2000/svg" width="672" height="768" viewBox="0 0 448 512"><path fill="currentColor" d="M352 0c53 0 96 43 96 96v320c0 53-43 96-96 96H32c-17.7 0-32-14.3-32-32s14.3-32 32-32v-64c-17.7 0-32-14.3-32-32V32C0 14.3 14.3 0 32 0h32zm0 384H96v64h256c17.7 0 32-14.3 32-32s-14.3-32-32-32m-77.9-233.8l-8.9 21.4l-23.1 1.9c-5.7.5-8 7.5-3.7 11.2l17.6 15.1l-5.4 22.6c-1.3 5.5 4.7 9.9 9.6 6.9l19.8-12.1l19.8 12.1c4.9 3 10.9-1.4 9.6-6.9l-5.4-22.6l17.6-15.1c4.3-3.7 2-10.8-3.7-11.2l-23.1-1.9l-8.9-21.4c-2.2-5.3-9.6-5.3-11.8 0M96 192c0 70.7 57.3 128 128 128c25.6 0 49.5-7.5 69.5-20.5c3.2-2.1 4.5-6.2 3.1-9.7s-5.2-5.6-9-4.8c-6.1 1.2-12.5 1.9-19 1.9c-52.4 0-94.9-42.5-94.9-94.9s42.5-94.9 94.9-94.9c6.5 0 12.8.7 19 1.9c3.8.8 7.5-1.3 9-4.8s.2-7.6-3.1-9.7c-20-13-43.9-20.5-69.5-20.5c-70.7 0-128 57.3-128 128"/></svg>';

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
                child: const TabBar(tabs: [
                  Tab(
                    icon: Iconify(bookQuran),
                  ),
                  Tab(
                    icon: FaIcon(FontAwesomeIcons.house),
                  ),
                  Tab(
                    icon: FaIcon(FontAwesomeIcons.solidUser),
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

class TasbihSection extends StatelessWidget {
  const TasbihSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('0/',
                  style:
                      TextStyle(fontSize: 36, fontWeight: Global().semiBold)),
              Text('33',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: Global().semiBold,
                      decoration: TextDecoration.underline))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.0),
            child: Image.asset('assets/images/tasbih.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Center(
              child: Text(
                'Klik di mana saja\nuntuk mulai',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: Global().light,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class KalenderSection extends StatelessWidget {
  const KalenderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 26.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/back.png', width: 10.0),
              Text(
                'Rajab 1445H',
                style: TextStyle(fontSize: 16, fontWeight: Global().bold),
              ),
              Image.asset('assets/images/next.png', width: 10.0),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: SizedBox(
                        width: 25.0,
                        height: 25.0,
                        child: Center(
                          child: Text(
                            'M',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: Global().regular,
                                fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          'S',
                          style: TextStyle(
                              fontWeight: Global().regular, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          'S',
                          style: TextStyle(
                              fontWeight: Global().regular, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          'R',
                          style: TextStyle(
                              fontWeight: Global().regular, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          'K',
                          style: TextStyle(
                              fontWeight: Global().regular, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          'J',
                          style: TextStyle(
                              fontWeight: Global().regular, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          'S',
                          style: TextStyle(
                              fontWeight: Global().regular, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '25',
                          style: TextStyle(
                              color: Global().graySecondary,
                              fontWeight: Global().extraBold,
                              fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '26',
                          style: TextStyle(
                              color: Global().graySecondary,
                              fontWeight: Global().extraBold,
                              fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '27',
                          style: TextStyle(
                              color: Global().graySecondary,
                              fontWeight: Global().extraBold,
                              fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '28',
                          style: TextStyle(
                              color: Global().graySecondary,
                              fontWeight: Global().extraBold,
                              fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '29',
                          style: TextStyle(
                              color: Global().graySecondary,
                              fontWeight: Global().extraBold,
                              fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '30',
                          style: TextStyle(
                              color: Global().graySecondary,
                              fontWeight: Global().extraBold,
                              fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '2',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '3',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '4',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '5',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '6',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '7',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '8',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '9',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '10',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '11',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '12',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      width: 25.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                          color: Global().greenPrimary,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Center(
                        child: Text(
                          '13',
                          style: TextStyle(
                              fontWeight: Global().extraBold,
                              color: Global().white,
                              fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '14',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '15',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '16',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '17',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '18',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '19',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '20',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '21',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '22',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '23',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '24',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '25',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '26',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '27',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '28',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '29',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
