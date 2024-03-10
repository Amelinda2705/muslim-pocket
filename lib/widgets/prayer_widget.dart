import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:muslimpocket/commons/global.dart';
import 'package:intl/intl.dart';
import 'package:geocoding/geocoding.dart';

class PrayerWidget extends StatefulWidget {
  const PrayerWidget({super.key});

  @override
  State<PrayerWidget> createState() => _PrayerWidgetState();
}

class _PrayerWidgetState extends State<PrayerWidget> {
  late Map<String, dynamic> prayerSchedule;

  List<Map<String, dynamic>> prayerIcon = [
    {'name': 'Subuh', 'id': 'Fajr', 'icon': 'assets/images/subuh.png'},
    {'name': 'Zuhur', 'id': 'Dhuhr', 'icon': 'assets/images/zuhur.png'},
    {'name': 'Asar', 'id': 'Asr', 'icon': 'assets/images/asar.png'},
    {'name': 'Magrib', 'id': 'Maghrib', 'icon': 'assets/images/magrib.png'},
    {'name': 'Isya', 'id': 'Isha', 'icon': 'assets/images/isya.png'},
  ];

  getSchedule() async {
    DateTime dateTime = DateTime.now();
    http.Response response = await http.get(Uri.parse(
        'https://api.aladhan.com/v1/calendarByCity/${dateTime.year}/${dateTime.month}?city=London&country=Bandung&method=2'));
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      Map<String, dynamic> dataResponse = jsonDecode(response.body);
      prayerSchedule = dataResponse['data'][dateTime.day - 1];
    }
    setState(() {});
  }

  getScheduleLocation() async {
    DateTime dateTime = DateTime.now();
    http.Response response = await http.get(Uri.parse(
        'https://api.aladhan.com/v1/calendar/${dateTime.year}/${dateTime.month}?latitude=${position.latitude}&longitude=${position.longitude}&method=4'));
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      Map<String, dynamic> dataResponse = jsonDecode(response.body);
      prayerSchedule = dataResponse['data'][dateTime.day - 1];
    }
    setState(() {});
  }

  late Position position;
  String currentAddress = 'Jakarta, Indonesia';
  bool isLoading = true;

  getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      setState(() {
        currentAddress = '${place.locality}, ${place.subAdministrativeArea}';
      });
    } catch (e) {
      print(e);
    }
  }

  inisiasi() async {
    isLoading = true;
    setState(() async {
      await getLocation();
      await getScheduleLocation();
    });
    isLoading = false;
    setState(() {
      const Center(
        child: CircularProgressIndicator(),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inisiasi();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${prayerSchedule['date']['hijri']['day']} ${prayerSchedule['date']['hijri']['month']['en']} ${prayerSchedule['date']['hijri']['year']} H',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: Global().semiBold,
                      fontFamily: 'Roboto'),
                ),
                Text(
                  '${currentAddress}',
                  style: TextStyle(fontSize: 12, fontWeight: Global().regular),
                ),
              ],
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: <Widget>[
              StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  String jam = DateFormat.Hm().format(DateTime.now());

                  return Text(
                    '${jam}',
                    style: TextStyle(
                      fontSize: 48,
                      color: Global().greenPrimary,
                      fontWeight: Global().bold,
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '1:37 ',
                    style: TextStyle(
                      color: Global().greenPrimary,
                      fontWeight: Global().bold,
                    ),
                  ),
                  const Text('sebelum adzan Magrib')
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          decoration: BoxDecoration(
            color: Global().bgBlur,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(prayerIcon.length, (index) {
                String waktuSolat =
                    '${prayerSchedule['timings']['${prayerIcon[index]['id']}']}'
                        .split(' ')[0];
                String waktuSolatSelanjutnya = index + 1 == prayerIcon.length
                    ? '${prayerSchedule['timings']['${prayerIcon[0]['id']}']}'
                        .split(' ')[0]
                    : '${prayerSchedule['timings']['${prayerIcon[index + 1]['id']}']}'
                        .split(' ')[0];
                DateTime sekarang = DateTime.now();
                DateTime jadwalSolat = DateTime(
                  sekarang.year,
                  sekarang.month,
                  sekarang.day,
                  int.parse(waktuSolat.split(':')[0]),
                  int.parse(waktuSolat.split(':')[1]),
                );
                DateTime jadwalSolatSelanjutnya = DateTime(
                  sekarang.year,
                  sekarang.month,
                  sekarang.day,
                  int.parse(waktuSolatSelanjutnya.split(':')[0]),
                  int.parse(waktuSolatSelanjutnya.split(':')[1]),
                );
                bool isWaktuSolat = sekarang.isAfter(jadwalSolat) &&
                    sekarang.isBefore(jadwalSolatSelanjutnya);

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${prayerIcon[index]['name']}',
                      style: TextStyle(
                        color: isWaktuSolat
                            ? Global().greenPrimary
                            : Global().grayPrimary,
                        fontWeight:
                            isWaktuSolat ? Global().bold : Global().medium,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Image.asset(
                        '${prayerIcon[index]['icon']}',
                        width: 29.0,
                        height: 29.0,
                        color: isWaktuSolat
                            ? Global().greenPrimary
                            : Global().grayPrimary,
                      ),
                    ),
                    Text(
                      waktuSolat,
                      style: TextStyle(
                        color: isWaktuSolat
                            ? Global().greenPrimary
                            : Global().grayPrimary,
                        fontSize: 12,
                        fontWeight:
                            isWaktuSolat ? Global().bold : Global().regular,
                      ),
                    ),
                  ],
                );
              })),
        ),
      ],
    );
  }
}
