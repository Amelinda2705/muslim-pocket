import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:muslimpocket/commons/global.dart';
import 'package:muslimpocket/screens/home/home_screen.dart';
import 'package:muslimpocket/screens/profile/register.dart';
import 'package:muslimpocket/widgets/textfield_widget.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  void showmessage(String errorMessage) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(title: Text(errorMessage));
        });
  }

  void _signUserIn(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.of(context).pushReplacement<void, void>(
        MaterialPageRoute(
          builder: (BuildContext context) =>
              HomeScreen(currentSection: 'tracker'),
        ),
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'invalid-credential') {
        showmessage('mohon cek lagi mengenai format email dan password');
      } else {
        showmessage(e.code);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Global().white,
          ),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  Column(
                    children: [
                      SizedBox(
                        width: width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(
                              'assets/images/login.png',
                              width: width * .9,
                            ),
                            Center(
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: height * .02,
                                ),
                                width: width * .8,
                                child: Text(
                                  'Selamat datang kembali!',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: Global().semiBold,
                                    color: Global().greenPrimary,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: width * .065,
                          vertical: height * .05,
                        ),
                        width: width,
                        decoration: BoxDecoration(
                          color: Global().bgBlur,
                          borderRadius: BorderRadius.circular(21.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: height * .05,
                              padding: EdgeInsets.symmetric(
                                vertical: height * .005,
                                horizontal: width * .015,
                              ),
                              decoration: BoxDecoration(
                                color: Global().bgBlur,
                                borderRadius: BorderRadius.circular(21.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 4.0,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: width * .415,
                                    decoration: BoxDecoration(
                                      color: Global().greenPrimary,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          Global().greenPrimary,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushReplacement<void, void>(
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                LoginPage(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Masuk',
                                        style: TextStyle(
                                          color: Global().white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * .01,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushReplacement<void, void>(
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              RegisterPage(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: width * .415,
                                      height: height * .037,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      child: Text(
                                        'Daftar',
                                        style: TextStyle(
                                          color: Global().greenPrimary,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(
                                vertical: height * .02,
                                horizontal: width * .04,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                      color: Global().greenPrimary,
                                      fontWeight: Global().semiBold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: height * .01),
                                  FormContainerWidget(
                                    inputType: TextInputType.emailAddress,
                                    controller: _emailController,
                                    hintText: "example.gmail.com",
                                    isPasswordField: false,
                                    prefixIcon: const Icon(Icons.person),
                                    autoFocus: true,
                                    textInputAction: TextInputAction.next,
                                  ),
                                  SizedBox(height: height * .02),
                                  Text(
                                    'Password',
                                    style: TextStyle(
                                      color: Global().greenPrimary,
                                      fontWeight: Global().semiBold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: height * .01),
                                  FormContainerWidget(
                                    controller: _passwordController,
                                    hintText: "********",
                                    isPasswordField: true,
                                    prefixIcon: const Icon(Icons.key),
                                    autoFocus: true,
                                  ),
                                  SizedBox(height: height * .01),
                                  Text(
                                    'Lupa Password?',
                                    style: TextStyle(
                                      color: Global().greenPrimary,
                                      fontSize: 12,
                                      fontWeight: Global().light,
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 2,
                                      decorationColor: Global().greenPrimary,
                                    ),
                                  ),
                                  SizedBox(height: height * .02),

                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Global().greenPrimary,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          Global().greenPrimary,
                                        ),
                                      ),
                                      onPressed: () => _signUserIn(context),
                                      child: Text(
                                        'Masuk',
                                        style: TextStyle(
                                          color: Global().white,
                                          fontWeight: Global().bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  // const Column(
                                  //   children: [
                                  //     SizedBox(height: 50),
                                  //     Divider(),
                                  //     SizedBox(height: 10),
                                  //     Text(
                                  //       'Or continue with',
                                  //       textAlign: TextAlign.center,
                                  //       style:
                                  //           TextStyle(color: Color(0xFF707070)),
                                  //     ),
                                  //     SizedBox(height: 10),
                                  //     Divider(),
                                  //     SizedBox(height: 50),
                                  //     Row(
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.center,
                                  //       children: [
                                  //         FaIcon(FontAwesomeIcons.google),
                                  //         SizedBox(width: 25),
                                  //         FaIcon(FontAwesomeIcons.apple),
                                  //       ],
                                  //     ),
                                  //     SizedBox(height: 50),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            HomeScreen(currentSection: 'tracker'),
                      ),
                      ModalRoute.withName('/'),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Masuk sebagai tamu',
                        style: TextStyle(
                          color: Global().greenPrimary,
                          fontWeight: Global().extraBold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: width * .01,
                      ),
                      FaIcon(
                        FontAwesomeIcons.chevronRight,
                        size: width * .045,
                        color: Global().greenPrimary,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // void _logIn() async {
  //   setState(() {
  //     _isSigning = true;
  //   });

  //   String email = _emailController.text;
  //   String password = _passwordController.text;

  //   User? user = await _auth.signInWithEmailAndPassword(email, password);

  //   if (user != null) {
  //     print('User is successfully created');
  //     Navigator.pushNamed(context, "/home");
  //   } else {
  //     print('some error happened');
  //   }

  //   // setState(() {
  //   //   _isSigning = false;
  //   // });
  // }
}
