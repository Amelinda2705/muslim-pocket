import 'package:flutter/material.dart';
import 'package:muslimpocket/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    HomePage homePage = const HomePage();
    MaterialApp materialApp = MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: homePage,
    );

    return materialApp;
  }
}
