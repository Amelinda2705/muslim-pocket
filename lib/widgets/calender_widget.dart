import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:muslimpocket/commons/global.dart';

class KalenderSection extends StatefulWidget {
  const KalenderSection({super.key});

  @override
  State<KalenderSection> createState() => _KalenderSectionState();
}

class _KalenderSectionState extends State<KalenderSection> {
  late Map<String, dynamic> calender = {};

  getDate() async {
    DateTime dateTime = DateTime.now();

    http.Response response = await http.get(Uri.parse(
        'https://api.aladhan.com/v1/hToGCalendar/${dateTime.month}/${dateTime.year}'));
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      Map<String, dynamic> dataResponse = jsonDecode(response.body);
      calender = dataResponse['data'][dateTime.day - 1]['hijri'];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 38.0,
        vertical: 26.0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/back.png',
                width: 10.0,
              ),
              Text(
                '${calender['month']} 1445H',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: Global().bold,
                ),
              ),
              Image.asset(
                'assets/images/next.png',
                width: 10.0,
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: SizedBox(
                        width: 25.0,
                        height: 25.0,
                        child: Center(
                          child: Text(
                            'M',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: Global().regular,
                                fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          'S',
                          style: TextStyle(
                            fontWeight: Global().regular,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          'S',
                          style: TextStyle(
                              fontWeight: Global().regular, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          'R',
                          style: TextStyle(
                              fontWeight: Global().regular, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          'K',
                          style: TextStyle(
                              fontWeight: Global().regular, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          'J',
                          style: TextStyle(
                              fontWeight: Global().regular, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          'S',
                          style: TextStyle(
                              fontWeight: Global().regular, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '25',
                          style: TextStyle(
                              color: Global().graySecondary,
                              fontWeight: Global().extraBold,
                              fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '26',
                          style: TextStyle(
                              color: Global().graySecondary,
                              fontWeight: Global().extraBold,
                              fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '27',
                          style: TextStyle(
                              color: Global().graySecondary,
                              fontWeight: Global().extraBold,
                              fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '28',
                          style: TextStyle(
                              color: Global().graySecondary,
                              fontWeight: Global().extraBold,
                              fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '29',
                          style: TextStyle(
                              color: Global().graySecondary,
                              fontWeight: Global().extraBold,
                              fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '30',
                          style: TextStyle(
                              color: Global().graySecondary,
                              fontWeight: Global().extraBold,
                              fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '2',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '3',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '4',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '5',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '6',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '7',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '8',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '9',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '10',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '11',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '12',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      width: 25.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                          color: Global().greenPrimary,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Center(
                        child: Text(
                          '13',
                          style: TextStyle(
                              fontWeight: Global().extraBold,
                              color: Global().white,
                              fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '14',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '15',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '16',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '17',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '18',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '19',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '20',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '21',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '22',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '23',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '24',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '25',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '26',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '27',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '28',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: Center(
                        child: Text(
                          '29',
                          style: TextStyle(
                              fontWeight: Global().extraBold, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
