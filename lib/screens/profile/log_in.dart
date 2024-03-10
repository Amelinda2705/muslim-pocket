import 'package:flutter/material.dart';
import 'package:muslimpocket/commons/global.dart';
import 'package:muslimpocket/widgets/login_widget.dart';
import 'package:muslimpocket/widgets/signup_widget.dart';

class AuthentificationScreen extends StatefulWidget {
  const AuthentificationScreen({super.key});

  @override
  State<AuthentificationScreen> createState() => _AuthentificationScreenState();
}

class _AuthentificationScreenState extends State<AuthentificationScreen> {
  String currentSection = 'login';

  Widget getContentWidget() {
    switch (currentSection) {
      case 'login':
        return const LogInWidget();
      case 'signup':
        return const SignUpWidget();
      default:
        return const LogInWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Global().greenPrimary,
            ),
            height: height,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
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
                Container(
                  width: 325.0,
                  height: 43.0,
                  decoration: BoxDecoration(
                      color: Global().bgBlur,
                      borderRadius: BorderRadius.circular(21.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                currentSection = 'login';
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (currentSection == 'login') {
                                    return Global().greenPrimary;
                                  }
                                  return Global().bgBlur;
                                },
                              ),
                              foregroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (currentSection == 'login') {
                                    return Global().white;
                                  }
                                  return Colors.black;
                                },
                              ),
                            ),
                            child: const Text('login')),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                currentSection = 'signup';
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (currentSection == 'signup') {
                                    return Global().greenPrimary;
                                  }
                                  return Global().bgBlur;
                                },
                              ),
                              foregroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (currentSection == 'signup') {
                                    return Global().white;
                                  }
                                  return Colors.black;
                                },
                              ),
                            ),
                            child: const Text('signup')),
                      ],
                    ),
                  ),
                ),
                getContentWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
