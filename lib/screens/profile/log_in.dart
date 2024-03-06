import 'package:flutter/material.dart';
import 'package:muslimpocket/commons/global.dart';
import 'package:muslimpocket/widgets/login_widget.dart';
import 'package:muslimpocket/widgets/signup_widget.dart';

class authentificationScreen extends StatefulWidget {
  const authentificationScreen({super.key});

  @override
  State<authentificationScreen> createState() => _authentificationScreenState();
}

class _authentificationScreenState extends State<authentificationScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String currentWidget = 'login';

    Widget getContentWidget() {
      switch (currentWidget) {
        case 'login':
          return const LogInWidget();
        case 'signup':
          return const SignUpWidget();
        default:
          return const LogInWidget();
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: Global().greenPrimary,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    width: width * .50,
                    child: Text(
                      'Selamat datang!',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: Global().semiBold,
                        color: Global().white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Image.asset(
                    'assets/images/auth.png',
                    width: width * .50,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: width * .1,
                      vertical: height * .05,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: width * .01,
                    ),
                    width: width,
                    decoration: BoxDecoration(
                        color: Global().bgLogin,
                        borderRadius: BorderRadius.circular(25)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Global().bgLogin,
                                foregroundColor: Global().white,
                              ),
                              onPressed: () {
                                setState(() {
                                  String currentWidget = 'login';
                                });
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * .083),
                                  child: Text('Masuk')),
                            ),
                            SizedBox(
                              width: width * .01,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Global().bgLogin,
                                foregroundColor: Global().white,
                              ),
                              onPressed: () {
                                setState(() {
                                  String currentWidget = 'signup';
                                });
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * .083),
                                  child: Text('Daftar')),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Email'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
