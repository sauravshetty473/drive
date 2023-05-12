import 'dart:async';
import 'package:flutter/material.dart';
import '../pages/Login/login.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(
        const Duration(seconds: 2),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Login())));
  }
}
