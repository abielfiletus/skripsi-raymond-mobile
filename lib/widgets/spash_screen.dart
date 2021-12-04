import 'package:flutter/material.dart';
import 'package:skripsi_raymond/constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryBackground,
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          'assets/images/logo.png',
          width: 70,
          height: 70,
        ),
      ),
    );
  }
}
