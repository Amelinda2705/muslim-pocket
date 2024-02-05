import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const textGreen = Color.fromRGBO(1, 68, 33, 1);
    const textGray = Color.fromARGB(255, 75, 75, 75);
    const textWhite = Color.fromARGB(255, 255, 255, 255);
    const bgBlur = Color.fromRGBO(217, 217, 217, .3);
    const bgNotYet = Color.fromRGBO(217, 217, 217, 1);
    const bgDone = Color.fromRGBO(179, 230, 185, 1);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: <Widget>[
                Text(
                  '13 Rajab 1445 H',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Jakarta, Indonesia',
                  style: TextStyle(fontSize: 12),
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
                      color: textGreen,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '1:37 ',
                        style: TextStyle(
                          color: textGreen,
                          fontWeight: FontWeight.w800,
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
                              color: textGray, fontWeight: FontWeight.w600),
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
                              color: textGray, fontWeight: FontWeight.w600),
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
                              color: textGreen, fontWeight: FontWeight.w600),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                          child: Image.asset(
                            'assets/images/asar.png',
                            width: 30.0,
                            height: 30.0,
                            color: textGreen,
                          ),
                        ),
                        Text(
                          '15:26',
                          style: TextStyle(color: textGreen, fontSize: 12),
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
                              color: textGray, fontWeight: FontWeight.w600),
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
                              color: textGray, fontWeight: FontWeight.w600),
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
                            color: textGreen,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Tracker',
                                  style: TextStyle(
                                    color: textWhite,
                                    fontWeight: FontWeight.w600,
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
                                  fontWeight: FontWeight.w600,
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
                                  fontWeight: FontWeight.w600,
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
                                color: textGreen,
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
                                    fontWeight: FontWeight.w600,
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
                                    fontWeight: FontWeight.w600,
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
                                    fontWeight: FontWeight.w600,
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
                                    fontWeight: FontWeight.w600,
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
                                    fontWeight: FontWeight.w600,
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
                                    fontWeight: FontWeight.w600,
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
                                  fontWeight: FontWeight.w600,
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
                                  fontWeight: FontWeight.w600,
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
                                  fontWeight: FontWeight.w600,
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
                                  fontWeight: FontWeight.w600,
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
                                  fontWeight: FontWeight.w600,
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
                            color: textGreen,
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Edit',
                              style: TextStyle(
                                color: textWhite,
                                fontSize: 11,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ))
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
