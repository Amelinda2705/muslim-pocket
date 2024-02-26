import 'package:flutter/material.dart';
import 'package:muslimpocket/commons/global.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/profile.png',
                    width: 100,
                    height: 100,
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
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Masuk',
                      style: TextStyle(
                        fontWeight: Global().semiBold,
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                      ),
                    ),
                    Text(
                      ' atau ',
                      style: TextStyle(
                        fontWeight: Global().semiBold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'Daftar',
                      style: TextStyle(
                        fontWeight: Global().semiBold,
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 185,
                child: Text(
                  'Masuk untuk membuka akses semua fitur',
                  style: TextStyle(color: Global().greenPrimary),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                // width: 325,
                height: 124,
                margin: const EdgeInsets.symmetric(horizontal: 22),
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
                      style:
                          TextStyle(fontWeight: Global().medium, fontSize: 15),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  children: [
                    Container(
                      width: 154,
                      height: 145,
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
                    Container(),
                  ],
                ),
              )
            ],
          ),
          const Column(),
        ],
      ),
    );
  }
}
