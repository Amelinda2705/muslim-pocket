import 'package:flutter/material.dart';
import 'package:muslimpocket/screens/home.dart';

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
