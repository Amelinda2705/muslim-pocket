import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:muslimpocket/commons/global.dart';
import 'package:muslimpocket/screens/profile/log_in.dart';
import 'package:muslimpocket/screens/profile/register.dart';
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

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85.0),
        child: AppBar(
          toolbarHeight: 85.0,
          centerTitle: true,
          scrolledUnderElevation: 0.0,
          title: Text(
            'Profile',
            style: TextStyle(fontSize: 24, fontWeight: Global().semiBold),
          ),
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
                      height: height * .07,
                      width: width,
                      child: WrapperWidget(
                        builder: (user) {
                          if (user == null) {
                            return Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 15, bottom: 7),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .pushReplacement<void, void>(
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
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
                                              builder: (BuildContext context) =>
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
                                  width: 185,
                                  child: Text(
                                    'Masuk untuk membuka akses semua fitur',
                                    style:
                                        TextStyle(color: Global().greenPrimary),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            );
                          } else {
                            String? userName = user.displayName;
                            if (userName == null) {
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
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
                                          Navigator.pushNamed(
                                              context, "/login");
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
                            } else {
                              return Column(
                                children: [
                                  Text(userName),
                                  const InkWell(
                                    child: Text('Logout'),
                                  ),
                                ],
                              );
                            }
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
                Container(
                  height: 124,
                  margin: const EdgeInsets.only(
                    bottom: 22,
                    right: 20,
                    left: 20,
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
                        width: 85,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Baca Al-Quran',
                        style: TextStyle(
                            fontWeight: Global().medium, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: width * .4,
                        height: 146,
                        decoration: const BoxDecoration(
                          color: Color(0xFFB3E6B9),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/kalender.png',
                              width: 34,
                              height: 39,
                            ),
                            const SizedBox(
                              height: 10,
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
                      Container(
                        width: width * .4,
                        height: 146,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: const BoxDecoration(
                          color: Color(0xFFB3E6B9),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/progress.png',
                              width: 34,
                              height: 39,
                            ),
                            const SizedBox(
                              height: 10,
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
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
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
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            'Review aplikasi ini',
                            style: TextStyle(fontSize: 12),
                          ),
                          const Icon(Icons.navigate_next_rounded)
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.mobile_friendly_rounded,
                            color: Global().greenPrimary,
                          ),
                          const SizedBox(
                            width: 8,
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
    );
  }
}
