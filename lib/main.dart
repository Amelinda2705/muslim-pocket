import 'package:flutter/material.dart';
import 'package:muslimpocket/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
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
        // '/': (context) => SplashScreen(
        //   // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
        //   child: LoginPage(),
        // ),
        // '/login': (context) => LoginPage(),
        // '/signUp': (context) => SignUpPage(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
