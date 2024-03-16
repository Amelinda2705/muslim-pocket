import 'package:flutter/material.dart';
import 'package:muslimpocket/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:muslimpocket/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:muslimpocket/widgets/tracker_form_widget.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      routes: { 
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginOrRegister(),
        // '/form': (context) => const FormWidget(),
      },
    );
  }
}
