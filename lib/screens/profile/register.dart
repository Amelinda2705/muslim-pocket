import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:muslimpocket/commons/global.dart';
import 'package:muslimpocket/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:muslimpocket/screens/home/home_screen.dart';
import 'package:muslimpocket/screens/profile/log_in.dart';
import 'package:muslimpocket/screens/profile/register.dart';
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
          return Center(child: CircularProgressIndicator());
        });

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      Navigator.of(context).pushReplacement<void, void>(
          MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'email-already-in-use') {
        showmessage('alamat email sudah dipakai, gunakan alamat email lain.');
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
                          child: const Text('Daftar'),
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
                      SizedBox(height: height * .03),
                      Row(
                        children: [
                          const SizedBox(height: 50),
                          const Divider(),
                          const SizedBox(height: 10),
                          const Text(
                            'Or continue with',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color(0xFF707070)),
                          ),
                          const SizedBox(height: 10),
                          const Divider(),
                          const SizedBox(height: 50),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(FontAwesomeIcons.google),
                              SizedBox(width: 25),
                              FaIcon(FontAwesomeIcons.apple),
                            ],
                          ),
                          const SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Belum punya akun? ',
                                style: TextStyle(
                                  color: Global().white,
                                  fontSize: 12,
                                  fontWeight: Global().light,
                                ),
                              ),
                              const SizedBox(width: 4),
                              GestureDetector(
                                onTap: widget.onTap,
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
                          ),
                        ],
                      ),
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
