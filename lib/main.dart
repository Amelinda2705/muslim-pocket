import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:home_widget/home_widget.dart';

import 'package:muslimpocket/commons/notification.dart';
import 'package:muslimpocket/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:muslimpocket/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:muslimpocket/resources/datas/widget_data.dart';

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:device_preview/device_preview.dart';

// variable for home widget
const String appGroupId = '';
const String iOSWidgetName = 'quranWidget';
const String androidWidgetName = 'quranWidget';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationService().initNotification();

  runApp(
    const MyApp(),
  );
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: HomeScreen(currentSection: 'tracker'),
      routes: {
        '/home': (context) => HomeScreen(currentSection: 'tracker'),
        '/login': (context) => const LoginOrRegister(),
      },
    );
  }
}

void updateHeadline(AyatQuran newHeadline) {
  // Save the headline data to the widget
  HomeWidget.saveWidgetData<String>('headline_title', newHeadline.ayat);
  HomeWidget.saveWidgetData<String>(
      'headline_description', newHeadline.tranlation);
  HomeWidget.updateWidget(
    iOSName: iOSWidgetName,
    androidName: androidWidgetName,
  );
}
