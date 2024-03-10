import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:muslimpocket/commons/global.dart';
import 'package:muslimpocket/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:muslimpocket/screens/home/home_screen.dart';
import 'package:muslimpocket/widgets/textfield_widget.dart';

class LogInWidget extends StatefulWidget {
  const LogInWidget({super.key});

  @override
  State<LogInWidget> createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> {
  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
              child: Text(
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
        ],
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

    setState(() {
      _isSigning = false;
    });
  }
}
