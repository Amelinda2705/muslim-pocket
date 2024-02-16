import 'package:flutter/material.dart';
import 'package:muslimpocket/screens/global.dart';
import 'package:muslimpocket/screens/quran/quran_screen.dart';

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
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Column(
                                children: [
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        '13 Rajab 1445 H',
                                        style: TextStyle(
                                            fontSize: 14, fontWeight: semiBold),
                                      ),
                                      Text(
                                        'Jakarta, Indonesia',
                                        style: TextStyle(
                                            fontSize: 12, fontWeight: regular),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 20.0),
                                child: const Column(
                                  children: <Widget>[
                                    Text(
                                      '16:40',
                                      style: TextStyle(
                                        fontSize: 48,
                                        color: greenPrimary,
                                        fontWeight: bold,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '1:37 ',
                                          style: TextStyle(
                                            color: greenPrimary,
                                            fontWeight: bold,
                                          ),
                                        ),
                                        Text('sebelum adzan Magrib')
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 24),
                                decoration: BoxDecoration(
                                    color: bgBlur,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Subuh',
                                            style: TextStyle(
                                                color: textGray, fontWeight: medium),
                                          ),
                                          Container(
                                            padding:
                                                const EdgeInsets.symmetric(vertical: 2.0),
                                            child: Image.asset(
                                              'assets/images/subuh.png',
                                              width: 30.0,
                                              height: 30.0,
                                            ),
                                          ),
                                          const Text(
                                            '04:27',
                                            style: TextStyle(
                                                color: textGray, fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Zuhur',
                                            style: TextStyle(
                                                color: textGray, fontWeight: medium),
                                          ),
                                          Container(
                                            padding:
                                                const EdgeInsets.symmetric(vertical: 2.0),
                                            child: Image.asset(
                                              'assets/images/zuhur.png',
                                              width: 30.0,
                                              height: 30.0,
                                            ),
                                          ),
                                          const Text(
                                            '12:05',
                                            style: TextStyle(
                                                color: textGray, fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Asar',
                                            style: TextStyle(
                                                color: greenPrimary,
                                                fontWeight: medium),
                                          ),
                                          Container(
                                            padding:
                                                const EdgeInsets.symmetric(vertical: 2.0),
                                            child: Image.asset(
                                              'assets/images/asar.png',
                                              width: 30.0,
                                              height: 30.0,
                                              color: greenPrimary,
                                            ),
                                          ),
                                          const Text(
                                            '15:26',
                                            style: TextStyle(
                                                color: greenPrimary, fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Magrib',
                                            style: TextStyle(
                                                color: textGray, fontWeight: medium),
                                          ),
                                          Container(
                                            padding:
                                                const EdgeInsets.symmetric(vertical: 2.0),
                                            child: Image.asset(
                                              'assets/images/magrib.png',
                                              width: 30.0,
                                              height: 30.0,
                                            ),
                                          ),
                                          const Text(
                                            '18:17',
                                            style: TextStyle(
                                                color: textGray, fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Isya',
                                            style: TextStyle(
                                                color: textGray, fontWeight: medium),
                                          ),
                                          Container(
                                            padding:
                                                const EdgeInsets.symmetric(vertical: 2.0),
                                            child: Image.asset(
                                              'assets/images/isya.png',
                                              width: 29.0,
                                              height: 29.0,
                                            ),
                                          ),
                                          const Text(
                                            '19:31',
                                            style: TextStyle(
                                                color: textGray, fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ]),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                            ],
                          ),
                          const Expanded(
                            child: SectionMenu(),
                          ),
                        ],
                      ),
                    ),
                    Container(),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
                width: width,
                child: const TabBar(tabs: [
                  Tab(
                    icon: Icon(Icons.add),
                  ),
                  Tab(
                    icon: Icon(Icons.home_outlined),
                  ),
                  Tab(
                    icon: Icon(Icons.add),
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
            color: bgBlur, borderRadius: BorderRadius.circular(21.0)),
        child: Column(
          children: [
            Container(
              width: 325.0,
              height: 43.0,
              decoration: BoxDecoration(
                  color: bgBlur, borderRadius: BorderRadius.circular(21.0)),
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
                                return greenPrimary;
                              }
                              return bgBlur;
                            },
                          ),
                          foregroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (currentSection == 'tracker') {
                                return Colors.white;
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
                                return greenPrimary;
                              }
                              return bgBlur;
                            },
                          ),
                          foregroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (currentSection == 'tasbih') {
                                return Colors.white;
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
                                return greenPrimary;
                              }
                              return bgBlur;
                            },
                          ),
                          foregroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (currentSection == 'kalender') {
                                return Colors.white;
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
            margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            decoration: BoxDecoration(
                color: greenPrimary, borderRadius: BorderRadius.circular(30.0)),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(greenPrimary)),
              onPressed: () {
                setState(() {
                  edit = true;
                });
              },
              child: const Text('Edit', style: TextStyle(color: white, fontSize: 12)),
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
                      color: greenPrimary,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '26',
                        style: TextStyle(
                          color: white,
                          fontSize: 13,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '27',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '28',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '29',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '30',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '31',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: medium,
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
                  color: bgDone, borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Subuh',
                      style: TextStyle(
                        fontWeight: medium,
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
                  color: bgDone, borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Zuhur',
                      style: TextStyle(
                        fontWeight: medium,
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
                  color: bgNotYet, borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Asar',
                      style: TextStyle(
                        fontWeight: medium,
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
                  color: bgNotYet, borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Magrib',
                      style: TextStyle(
                        fontWeight: medium,
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
                  color: bgNotYet, borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Isya',
                      style: TextStyle(
                        fontWeight: medium,
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
                      color: greenPrimary,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '26',
                        style: TextStyle(
                          color: white,
                          fontSize: 13,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '27',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '28',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '29',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '30',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '31',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: medium,
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
                  color: bgDone, borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Subuh',
                      style: TextStyle(
                        fontWeight: medium,
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
                  color: bgDone, borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Zuhur',
                      style: TextStyle(
                        fontWeight: medium,
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
                  color: bgNotYet, borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Asar',
                      style: TextStyle(
                        fontWeight: medium,
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
                  color: bgNotYet, borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Magrib',
                      style: TextStyle(
                        fontWeight: medium,
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
                  color: bgNotYet, borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Isya',
                      style: TextStyle(
                        fontWeight: medium,
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('0/', style: TextStyle(fontSize: 36, fontWeight: semiBold)),
              Text('33',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: semiBold,
                      decoration: TextDecoration.underline))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.0),
            child: Image.asset('assets/images/tasbih.png'),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: Center(
              child: Text(
                'Klik di mana saja\nuntuk mulai',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: light,
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
              const Text(
                'Rajab 1445H',
                style: TextStyle(fontSize: 16, fontWeight: bold),
              ),
              Image.asset('assets/images/next.png', width: 10.0),
            ],
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15.0),
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
                                fontWeight: regular,
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
                          style: TextStyle(fontWeight: regular, fontSize: 12),
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
                          style: TextStyle(fontWeight: regular, fontSize: 12),
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
                          style: TextStyle(fontWeight: regular, fontSize: 12),
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
                          style: TextStyle(fontWeight: regular, fontSize: 12),
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
                          style: TextStyle(fontWeight: regular, fontSize: 12),
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
                          style: TextStyle(fontWeight: regular, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
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
                              color: disableColor,
                              fontWeight: extraBold,
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
                              color: disableColor,
                              fontWeight: extraBold,
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
                              color: disableColor,
                              fontWeight: extraBold,
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
                              color: disableColor,
                              fontWeight: extraBold,
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
                              color: disableColor,
                              fontWeight: extraBold,
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
                              color: disableColor,
                              fontWeight: extraBold,
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
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '2',
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
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
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
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
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
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
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
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
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
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
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
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
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
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
                    const SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '9',
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '10',
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '11',
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '12',
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      width: 25.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                          color: greenPrimary,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: const Center(
                        child: Text(
                          '13',
                          style: TextStyle(
                              fontWeight: extraBold,
                              color: white,
                              fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '14',
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '15',
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '16',
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
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
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
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
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
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
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
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
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
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
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
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
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '23',
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
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
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
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
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
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
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
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
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
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
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
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
                          style: TextStyle(fontWeight: extraBold, fontSize: 12),
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
