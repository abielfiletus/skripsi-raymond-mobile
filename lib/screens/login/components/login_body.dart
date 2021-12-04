import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_raymond/constant.dart';
import 'package:skripsi_raymond/providers/auth_provider.dart';
import 'package:skripsi_raymond/screens/home/home_page.dart';
import 'package:skripsi_raymond/screens/register/register_page.dart';
import 'package:skripsi_raymond/widgets/custom_text_field.dart';
import 'package:skripsi_raymond/widgets/password_text_field.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final GlobalKey<FormBuilderState> globalFormKey = GlobalKey<FormBuilderState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final bool _passVisible = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: globalFormKey,
      child: Column(
        children: [
          CustomTextField(
            name: 'email',
            controller: emailController,
            hintText: 'E-Mail',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validators: FormBuilderValidators.compose([
              FormBuilderValidators.required(context, errorText: 'harus terisi'),
              FormBuilderValidators.email(context, errorText: 'email tidak valid'),
            ]),
          ),
          verticalSpacer2,
          CustomPasswordTextField(
            controller: passwordController,
            obscureText: _passVisible,
            name: 'password',
            hintText: 'Password',
            textInputAction: TextInputAction.done,
            validators: FormBuilderValidators.compose([
              FormBuilderValidators.required(context, errorText: 'harus terisi'),
              FormBuilderValidators.minLength(context, 6, errorText: 'minimal 6 karakter'),
            ]),
          ),
          verticalSpacer1,
          Row(
            children: [
              const Text('Belum punya akun ?'),
              const SizedBox(width: 3),
              RichText(
                text: TextSpan(
                  text: 'Daftar',
                  style: const TextStyle(
                    color: linkColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const RegisterPage(),
                        ),
                      );
                    },
                ),
              ),
            ],
          ),
          verticalSpacer4,
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(color: thirdBackground, borderRadius: BorderRadius.circular(10)),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                highlightColor: Colors.black12,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: _isLoading
                        ? const Text(
                            "Mohon Tunggu...",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                            textAlign: TextAlign.center,
                          )
                        : const Text(
                            "LOGIN",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                  ),
                ),
                onTap: () async {
                  if (!_isLoading) {
                    setState(() => _isLoading = true);

                    if (validateAndSave()) {
                      try {
                        await Provider.of<AuthProvider>(context, listen: false).login(
                          emailController.text,
                          passwordController.text,
                        );
                        setState(() => _isLoading = false);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => const HomePage()));
                        Fluttertoast.showToast(
                          msg: 'Berhasil Masuk.',
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                        );
                      } on HttpException catch (err) {
                        setState(() => _isLoading = false);
                        Fluttertoast.showToast(
                          msg: err.toString(),
                          backgroundColor: Colors.amber,
                          textColor: Colors.white,
                        );
                      } catch (err) {
                        setState(() => _isLoading = false);
                        Fluttertoast.showToast(
                          msg: err.toString(),
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                      }
                    } else {
                      setState(() => _isLoading = false);
                    }
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
