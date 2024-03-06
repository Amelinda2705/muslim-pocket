import 'package:flutter/material.dart';
import 'package:muslimpocket/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> initializeDefault() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const HomeScreen(),
    );
  }
}
