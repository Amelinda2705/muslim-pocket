import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WrapperWidget extends StatefulWidget {
  final Widget Function(User? user)? builder;
  final Widget? child;
  const WrapperWidget({super.key, this.child, this.builder,});

  @override
  State<WrapperWidget> createState() => _WrapperWidgetState();
}

class _WrapperWidgetState extends State<WrapperWidget> {
  bool isLogin = false;
  User? user;

  @override
  void initState() {
    super.initState();
    isLogin = FirebaseAuth.instance.currentUser != null;
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.builder != null ? widget.builder!(user) : widget.child,
    );
  }
}