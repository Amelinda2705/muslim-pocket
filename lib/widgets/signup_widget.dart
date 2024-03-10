import 'package:flutter/material.dart';
import 'package:muslimpocket/commons/global.dart';
import 'package:muslimpocket/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:muslimpocket/screens/home/home_screen.dart';
import 'package:muslimpocket/widgets/textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isSigningUp = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
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
            'Buat Password',
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
            onTap: _signUp,
            child: ElevatedButton(
              onPressed: _signUp,
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
          SizedBox(height: height * .03),
        ],
      ),
    );
  }

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      isSigningUp = false;
    });

    if (user != null) {
      print('User is successfully created');
      Navigator.pushNamed(context, "/home");
    } else {
      print('some error happened');
    }
  }
}
