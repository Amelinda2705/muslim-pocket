import 'package:flutter/material.dart';
import 'package:muslimpocket/global.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: <Widget>[
                  Text(
                    '13 Rajab 1445 H',
                    style: TextStyle(fontSize: 14, fontWeight: semiBold),
                  ),
                  Text(
                    'Jakarta, Indonesia',
                    style: TextStyle(fontSize: 12, fontWeight: regular),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      '16:40',
                      style: TextStyle(
                        fontSize: 48,
                        color: greenPrimary,
                        fontWeight: bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '1:37 ',
                          style: TextStyle(
                            color: greenPrimary,
                            fontWeight: bold,
                          ),
                        ),
                        Text('sebelum adzan Magrib')
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(
                    color: bgBlur, borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Subuh',
                            style: TextStyle(
                                color: textGray, fontWeight: medium),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                            child: Image.asset(
                              'assets/images/subuh.png',
                              width: 30.0,
                              height: 30.0,
                            ),
                          ),
                          Text(
                            '04:27',
                            style: TextStyle(color: textGray, fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Zuhur',
                            style: TextStyle(
                                color: textGray, fontWeight: medium),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                            child: Image.asset(
                              'assets/images/zuhur.png',
                              width: 30.0,
                              height: 30.0,
                            ),
                          ),
                          Text(
                            '12:05',
                            style: TextStyle(color: textGray, fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Asar',
                            style: TextStyle(
                                color: greenPrimary,
                                fontWeight: medium),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                            child: Image.asset(
                              'assets/images/asar.png',
                              width: 30.0,
                              height: 30.0,
                              color: greenPrimary,
                            ),
                          ),
                          Text(
                            '15:26',
                            style: TextStyle(color: greenPrimary, fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Magrib',
                            style: TextStyle(
                                color: textGray, fontWeight: medium),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                            child: Image.asset(
                              'assets/images/magrib.png',
                              width: 30.0,
                              height: 30.0,
                            ),
                          ),
                          Text(
                            '18:17',
                            style: TextStyle(color: textGray, fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Isya',
                            style: TextStyle(
                                color: textGray, fontWeight: medium),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                            child: Image.asset(
                              'assets/images/isya.png',
                              width: 29.0,
                              height: 29.0,
                            ),
                          ),
                          Text(
                            '19:31',
                            style: TextStyle(color: textGray, fontSize: 12),
                          ),
                        ],
                      ),
                    ]),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: bgBlur, borderRadius: BorderRadius.circular(21.0)),
                child: Column(
                  children: [
                    Container(
                      width: 325.0,
                      height: 43.0,
                      decoration: BoxDecoration(
                          color: bgBlur,
                          borderRadius: BorderRadius.circular(21.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 105.0,
                            height: 35.0,
                            margin: EdgeInsets.only(left: 3.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: greenPrimary,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Tracker',
                                    style: TextStyle(
                                      color: textWhite,
                                      fontWeight: medium,
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            width: 105.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Tasbih',
                                  style: TextStyle(
                                    fontWeight: medium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 105.0,
                            height: 35.0,
                            margin: EdgeInsets.only(right: 3.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Kalender',
                                  style: TextStyle(
                                    fontWeight: medium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/images/chevron-kiri.png'),
                          Container(
                              width: 32.0,
                              height: 32.0,
                              decoration: BoxDecoration(
                                  color: greenPrimary,
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '26',
                                    style: TextStyle(
                                      color: textWhite,
                                      fontSize: 13,
                                      fontWeight: medium,
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                              width: 32.0,
                              height: 32.0,
                              decoration: BoxDecoration(
                                  color: bgNotYet,
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '27',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: medium,
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                              width: 32.0,
                              height: 32.0,
                              decoration: BoxDecoration(
                                  color: bgNotYet,
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '28',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: medium,
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                              width: 32.0,
                              height: 32.0,
                              decoration: BoxDecoration(
                                  color: bgNotYet,
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '29',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: medium,
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                              width: 32.0,
                              height: 32.0,
                              decoration: BoxDecoration(
                                  color: bgNotYet,
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '30',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: medium,
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                              width: 32.0,
                              height: 32.0,
                              decoration: BoxDecoration(
                                  color: bgNotYet,
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '31',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: medium,
                                    ),
                                  ),
                                ],
                              )),
                          Image.asset('assets/images/chevron-right.png'),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          width: 237.0,
                          height: 34.0,
                          margin: EdgeInsets.only(top: 5.0),
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          decoration: BoxDecoration(
                              color: bgDone,
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Subuh',
                                  style: TextStyle(
                                    fontWeight: medium,
                                  ),
                                ),
                                Image.asset('assets/images/done.png')
                              ]),
                        ),
                        Container(
                          width: 237.0,
                          height: 34.0,
                          margin: EdgeInsets.only(top: 5.0),
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          decoration: BoxDecoration(
                              color: bgDone,
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Zuhur',
                                  style: TextStyle(
                                    fontWeight: medium,
                                  ),
                                ),
                                Image.asset('assets/images/done.png')
                              ]),
                        ),
                        Container(
                          width: 237.0,
                          height: 34.0,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          margin: EdgeInsets.only(top: 5.0),
                          decoration: BoxDecoration(
                              color: bgNotYet,
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Asar',
                                  style: TextStyle(
                                    fontWeight: medium,
                                  ),
                                ),
                                Image.asset('assets/images/not-yet.png')
                              ]),
                        ),
                        Container(
                          width: 237.0,
                          height: 34.0,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          margin: EdgeInsets.only(top: 5.0),
                          decoration: BoxDecoration(
                              color: bgNotYet,
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Magrib',
                                  style: TextStyle(
                                    fontWeight: medium,
                                  ),
                                ),
                                Image.asset('assets/images/not-yet.png')
                              ]),
                        ),
                        Container(
                          width: 237.0,
                          height: 34.0,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          margin: EdgeInsets.only(top: 5.0),
                          decoration: BoxDecoration(
                              color: bgNotYet,
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Isya',
                                  style: TextStyle(
                                    fontWeight: medium,
                                  ),
                                ),
                                Image.asset('assets/images/not-yet.png')
                              ]),
                        ),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Container(
                          width: 95.0,
                          height: 26.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                              color: greenPrimary,
                              borderRadius: BorderRadius.circular(30.0)),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        greenPrimary)),
                            onPressed: () {},
                            child: Text('Edit',
                                style: TextStyle(
                                  color: textWhite,
                                  fontSize: 12,
                                  decoration: TextDecoration.underline,
                                )),
                          )
                          // Column(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   children: [
                          //     Text(
                          //       'Edit',
                          //       style: TextStyle(
                          //         color: textWhite,
                          //         fontSize: 11,
                          //         decoration: TextDecoration.underline,
                          //       ),
                          //     ),
                          //   ],
                          // )
                          )
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
