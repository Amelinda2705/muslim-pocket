import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:muslimpocket/commons/global.dart';
import 'package:muslimpocket/screens/home/home_screen.dart';
import 'package:muslimpocket/screens/profile/log_in.dart';
import 'package:muslimpocket/widgets/textfield_widget.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  RegisterPage({Key? key, this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void showmessage(String errorMessage) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(title: Text(errorMessage));
        });
  }

  void _signUserup(BuildContext context) async {
    if (_passwordController.text != _confirmPasswordController.text) {
      showmessage("Password does not match");
      return;
    }

    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      Navigator.of(context).pushReplacement<void, void>(MaterialPageRoute(
          builder: (BuildContext context) => LoginPage(
                onTap: () {},
              )));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'email-already-in-use') {
        showmessage('alamat email sudah dipakai, gunakan alamat email lain.');
      } else if (e.code == 'invalid-email') {
        showmessage('masukkan email dengan benar');
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
            color: Global().greenPrimary,
          ),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  Column(
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
                        margin: EdgeInsets.symmetric(
                          horizontal: width * .065,
                          vertical: height * .05,
                        ),
                        width: width,
                        decoration: BoxDecoration(
                          color: Global().bgLogin,
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4.0,
                            ),
                          ],
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
                                  color: Global().bgLogin,
                                  borderRadius: BorderRadius.circular(21.0)),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushReplacement<void, void>(
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              LoginPage(),
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
                                        'Masuk',
                                        style: TextStyle(
                                          color: Global().white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * .01,
                                  ),
                                  Container(
                                    width: width * .415,
                                    decoration: BoxDecoration(
                                        color: Global().bgLogin,
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          Global().bgLogin,
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
                                        'Daftar',
                                        style: TextStyle(
                                          color: Global().white,
                                        ),
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
                                      color: Global().white,
                                      fontWeight: Global().semiBold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: height * .01),
                                  FormContainerWidget(
                                    controller: _emailController,
                                    hintText: "example.gmail.com",
                                    isPasswordField: false,
                                    prefixIcon: const Icon(Icons.person),
                                  ),
                                  SizedBox(height: height * .02),
                                  Text(
                                    'Password',
                                    style: TextStyle(
                                      color: Global().white,
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
                                  ),
                                  SizedBox(height: height * .02),
                                  Text(
                                    'Konfirmasi Password',
                                    style: TextStyle(
                                      color: Global().white,
                                      fontWeight: Global().semiBold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: height * .01),
                                  FormContainerWidget(
                                    controller: _confirmPasswordController,
                                    hintText: "********",
                                    isPasswordField: true,
                                    prefixIcon: const Icon(Icons.key),
                                  ),
                                  SizedBox(height: height * .02),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () => _signUserup(context),
                                      child: Text(
                                        'Daftar',
                                        style: TextStyle(
                                          color: Global().greenPrimary,
                                          fontWeight: Global().extraBold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  // Column(
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
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: width * .05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sudah punya akun? ',
                            style: TextStyle(
                              color: Global().white,
                              fontSize: 12,
                              fontWeight: Global().light,
                            ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement<void, void>(
                                MaterialPageRoute(
                                  builder: (BuildContext context) => LoginPage(
                                    onTap: () {},
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'Masuk',
                              style: TextStyle(
                                fontWeight: Global().semiBold,
                                color: Global().white,
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                decorationThickness: 2,
                                decorationColor: Global().white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => HomeScreen(),
                          ),
                          ModalRoute.withName('/'),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Masuk sebagai tamu',
                            style: TextStyle(
                              color: Global().white,
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
                            color: Global().white,
                          ),
                          SizedBox(
                            width: width * .07,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // void _signUp() async {
  //   // setState(() {
  //   //   _isSigning = true;
  //   // });

  //   String email = _emailController.text;
  //   String password = _passwordController.text;

  //   User? user = await _auth.signUpWithEmailAndPassword(email, password);

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
