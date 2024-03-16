import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:muslimpocket/commons/global.dart';
import 'package:muslimpocket/screens/profile/log_in.dart';
import 'package:muslimpocket/widgets/textfield_widget.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  RegisterPage({Key? key, required this.onTap}) : super(key: key);

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
      Navigator.of(context).pushReplacement<void, void>(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage(onTap: () {
            
          },)));
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * .1,
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 325.0,
                              height: 43.0,
                              decoration: BoxDecoration(
                                  color: Global().bgBlur,
                                  borderRadius: BorderRadius.circular(21.0)),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Daftar'),
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.symmetric(vertical: height * .02),
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
                                  SizedBox(height: height * .01),
                                  Text(
                                    'Lupa Password?',
                                    style: TextStyle(
                                      color: Global().white,
                                      fontSize: 12,
                                      fontWeight: Global().light,
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 2,
                                      decorationColor: Global().white,
                                    ),
                                  ),
                                  SizedBox(height: height * .02),
                                  ElevatedButton(
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
                                  const Column(
                                    children: [
                                      SizedBox(height: 50),
                                      Divider(),
                                      SizedBox(height: 10),
                                      Text(
                                        'Or continue with',
                                        textAlign: TextAlign.center,
                                        style:
                                            TextStyle(color: Color(0xFF707070)),
                                      ),
                                      SizedBox(height: 10),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FaIcon(FontAwesomeIcons.google),
                                          SizedBox(width: 25),
                                          FaIcon(FontAwesomeIcons.apple),
                                        ],
                                      ),
                                      SizedBox(height: 50),
                                    ],
                                  ),
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
                child: Container(
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
                          Navigator.of(context)
                              .pushReplacement<void, void>(MaterialPageRoute(
                                  builder: (BuildContext context) => LoginPage(
                                        onTap: () {},
                                      )));
                        },
                        child: Text(
                          'Masuk',
                          style: TextStyle(
                            fontWeight: Global().semiBold,
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            decorationThickness: 2,
                          ),
                        ),
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
