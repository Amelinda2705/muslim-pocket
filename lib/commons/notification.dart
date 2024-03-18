// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class PrayerNotifications {
//   late final FirebaseMessaging firebaseMessaging;
//   late final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

//   PrayerNotifications() {
//     firebaseMessaging = FirebaseMessaging.instance;
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     initializeFlutterLocalNotificationsPlugin();
//     configureFirebaseMessaging();
//     handleFirebaseMessaging();
//   }

//   void initializeFlutterLocalNotificationsPlugin() {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('app_icon');
//     final InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);
//     flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   void configureFirebaseMessaging() {
//     // Configure Firebase Messaging settings
//   }

//   void handleFirebaseMessaging() {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       // Handle FCM message
//       displayNotification(message);
//     });
//   }

//   void displayNotification(RemoteMessage message) async {
//     final String prayerTime = message.data['prayer_time'];
//     // Use prayerTime to determine the time of the prayer
//     // Calculate the time for notification (10 minutes before the prayer time)
//     DateTime notificationTime = // Calculate notification time here;
//     await scheduleNotification(notificationTime, 'Prayer Reminder', 'Prayer time is approaching');
//   }

//   Future<void> scheduleNotification(DateTime notificationTime, String title, String body) async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'channel_id',
//       'channel_name',
//       channelDescription: 'channel_description',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       0,
//       title,
//       body,
//       notificationTime,
//       platformChannelSpecifics,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//     );
//   }
// }
