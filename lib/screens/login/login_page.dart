import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skripsi_raymond/constant.dart';
import 'package:skripsi_raymond/screens/login/components/login_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: primaryBackground,
        padding: EdgeInsets.only(
          left: 25.0,
          right: 25.0,
          top: MediaQuery.of(context).padding.top + 30,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', width: 150, height: 150),
              const SizedBox(height: 15),
              const LoginBody()
            ],
          ),
        ),
      ),
    );
  }
}
