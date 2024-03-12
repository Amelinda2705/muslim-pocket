import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:muslimpocket/commons/global.dart';
import 'package:muslimpocket/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:muslimpocket/screens/home/home_screen.dart';
import 'package:muslimpocket/screens/profile/sign_up.dart';
import 'package:muslimpocket/widgets/textfield_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                          onPressed: () {},
                          child: Text('Masuk'),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: width * .055, vertical: height * .02),
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
                        prefixIcon: Icon(Icons.person),
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
                        prefixIcon: Icon(Icons.key),
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
                      GestureDetector(
                        onTap: _logIn,
                        child: ElevatedButton(
                          onPressed: _logIn,
                          child: _isSigning ? CircularProgressIndicator(color: Colors.white,) : Text(
                            'Masuk',
                            style: TextStyle(
                              color: Global().greenPrimary,
                              fontWeight: Global().extraBold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: height * .03),
                      Row(
                        children: [
                          Text(
                            'Belum punya akun? ',
                            style: TextStyle(
                              color: Global().white,
                              fontSize: 12,
                              fontWeight: Global().light,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushReplacement<void, void>(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const SignUpPage()));
                            },
                            child: Text(
                              'Daftar',
                              style: TextStyle(
                                fontWeight: Global().semiBold,
                                fontSize: 15,
                                decoration: TextDecoration.underline,
                                decorationThickness: 2,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _logIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      print('User is successfully created');
      Navigator.pushNamed(context, "/home");
    } else {
      print('some error happened');
    }

    // setState(() {
    //   _isSigning = false;
    // });
  }
}
