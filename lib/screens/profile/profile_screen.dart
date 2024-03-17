import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:muslimpocket/commons/global.dart';
import 'package:muslimpocket/screens/home/home_screen.dart';
import 'package:muslimpocket/screens/profile/log_in.dart';
import 'package:muslimpocket/screens/profile/register.dart';
import 'package:muslimpocket/screens/quran/quran_screen.dart';
import 'package:muslimpocket/widgets/wrapper_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void showmessage(String errorMessage) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(title: Text(errorMessage));
        });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * .09),
          child: AppBar(
            toolbarHeight: height * .09,
            centerTitle: true,
            scrolledUnderElevation: 0.0,
            title: Text(
              'Profile',
              style: TextStyle(fontSize: 24, fontWeight: Global().semiBold),
            ),
            leading: Container(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'assets/images/profile.png',
                        width: width * 0.25,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(
                          Icons.edit_square,
                          color: Global().grayPrimary,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: height * .1,
                        width: width,
                        child: WrapperWidget(
                          builder: (user) {
                            if (user == null) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: height * .01,
                                        bottom: height * .008),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        LoginPage(
                                                  onTap: () {},
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Masuk',
                                            style: TextStyle(
                                              fontWeight: Global().semiBold,
                                              fontSize: 15,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationThickness: 2,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          ' atau ',
                                          style: TextStyle(
                                            fontWeight: Global().semiBold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushReplacement<void, void>(
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        RegisterPage(
                                                  onTap: () {},
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Daftar',
                                            style: TextStyle(
                                              fontWeight: Global().semiBold,
                                              fontSize: 15,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationThickness: 2,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * .4,
                                    child: Text(
                                      'Masuk untuk membuka akses semua fitur',
                                      style: TextStyle(
                                          color: Global().greenPrimary),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: height * .01),
                                  child: Column(
                                    children: [
                                      Text(
                                        user.email.toString(),
                                        style: TextStyle(
                                          fontWeight: Global().semiBold,
                                          fontSize: 15,
                                          decorationThickness: 2,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          FirebaseAuth.instance.signOut();
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  LoginPage(),
                                            ),
                                            ModalRoute.withName('/'),
                                          );
                                          showmessage("Berhasil keluar");
                                        },
                                        child: const Center(
                                          child: Text(
                                            "Keluar",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const QuranScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: height * .14,
                      margin: EdgeInsets.only(
                        bottom: height * .02,
                        right: width * .06,
                        left: width * .06,
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xFFB3E6B9),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/quran.png',
                            width: width * .26,
                          ),
                          SizedBox(
                            width: width * .08,
                          ),
                          Text(
                            'Baca Al-Quran',
                            style: TextStyle(
                                fontWeight: Global().medium, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: width * .06),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: width * .43,
                            height: height * .16,
                            padding:
                                EdgeInsets.symmetric(horizontal: width * .06),
                            decoration: const BoxDecoration(
                              color: Color(0xFFB3E6B9),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/kalender.png',
                                  width: width * .09,
                                ),
                                SizedBox(
                                  height: height * .015,
                                ),
                                Text(
                                  'Buka Kalender Hijriyah',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: Global().medium,
                                      fontSize: 15,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const HomeScreen(),
                                ),
                              );
                            },
                            child: Container(
                              width: width * .43,
                              height: height * .16,
                              padding:
                                  EdgeInsets.symmetric(horizontal: width * .06),
                              decoration: const BoxDecoration(
                                color: Color(0xFFB3E6B9),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/progress.png',
                                    width: width * .09,
                                  ),
                                  SizedBox(
                                    height: height * .015,
                                  ),
                                  Text(
                                    'Lihat Track Prayer Saya',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: Global().medium,
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: width * .06, vertical: height * .02),
                    padding: EdgeInsets.symmetric(
                        horizontal: width * .06, vertical: height * .025),
                    decoration: BoxDecoration(
                      color: Global().bgBlur,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.stars_rounded,
                              color: Global().greenPrimary,
                            ),
                            SizedBox(
                              width: width * .02,
                            ),
                            const Text(
                              'Review aplikasi ini',
                              style: TextStyle(fontSize: 12),
                            ),
                            const Icon(Icons.navigate_next_rounded)
                          ],
                        ),
                        SizedBox(
                          height: height * .007,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.mobile_friendly_rounded,
                              color: Global().greenPrimary,
                            ),
                            SizedBox(
                              width: width * .02,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ini merupakan aplikasi versi terbaru',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  'versi 1.0.0',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
