import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_raymond/constant.dart';
import 'package:skripsi_raymond/providers/auth_provider.dart';
import 'package:skripsi_raymond/screens/login/login_page.dart';
import 'package:skripsi_raymond/widgets/custom_text_field.dart';
import 'package:skripsi_raymond/widgets/password_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormBuilderState> globalFormKey = GlobalKey<FormBuilderState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmationPasswordController = TextEditingController();

  String _jenisKelamin = '';
  final bool _passVisible = true;
  final bool _confirmationPassVisible = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REGISTER'),
        backgroundColor: fourthBackground,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          splashColor: Colors.transparent,
          tooltip: 'Kembali',
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: primaryBackground,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 25.0,
              vertical: MediaQuery.of(context).padding.top,
            ),
            child: FormBuilder(
              key: globalFormKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: firstNameController,
                    hintText: 'Nama Depan',
                    name: 'first name',
                    textInputAction: TextInputAction.next,
                    validators: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        context,
                        errorText: 'harus terisi',
                      ),
                    ]),
                  ),
                  verticalSpacer2,
                  CustomTextField(
                    controller: lastNameController,
                    hintText: 'Nama Belakang',
                    name: 'last name',
                    textInputAction: TextInputAction.next,
                    validators: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        context,
                        errorText: 'harus terisi',
                      ),
                    ]),
                  ),
                  verticalSpacer2,
                  FormBuilderRadioGroup(
                    name: 'jenis kelamin',
                    activeColor: Colors.white,
                    wrapSpacing: 40,
                    options: const [
                      FormBuilderFieldOption(
                        child: Text(
                          'Laki-Laki',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: 'L',
                      ),
                      FormBuilderFieldOption(
                        child: Text(
                          'Perempuan',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: 'P',
                      )
                    ],
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      border: InputBorder.none,
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        context,
                        errorText: 'harus terisi',
                      )
                    ]),
                    onChanged: (value) {
                      setState(() => _jenisKelamin = value.toString());
                      debugPrint(_jenisKelamin);
                    },
                  ),
                  verticalSpacer2,
                  CustomTextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'E-Mail',
                    name: 'email',
                    textInputAction: TextInputAction.next,
                    validators: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        context,
                        errorText: 'harus terisi',
                      ),
                      FormBuilderValidators.email(
                        context,
                        errorText: 'email tidak valid',
                      ),
                    ]),
                  ),
                  verticalSpacer2,
                  CustomTextField(
                    controller: noHpController,
                    keyboardType: TextInputType.phone,
                    hintText: 'Nomor Telepon',
                    name: 'no hp',
                    textInputAction: TextInputAction.next,
                    validators: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        context,
                        errorText: 'harus terisi',
                      ),
                    ]),
                  ),
                  verticalSpacer2,
                  CustomTextField(
                    controller: usernameController,
                    hintText: 'Username',
                    name: 'username',
                    textInputAction: TextInputAction.next,
                    validators: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        context,
                        errorText: 'harus terisi',
                      ),
                    ]),
                  ),
                  verticalSpacer2,
                  CustomPasswordTextField(
                    controller: passwordController,
                    obscureText: _passVisible,
                    name: 'password',
                    hintText: 'Password',
                    textInputAction: TextInputAction.next,
                    validators: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context, errorText: 'harus terisi'),
                      FormBuilderValidators.minLength(context, 6, errorText: 'minimal 6 karakter'),
                      (val) {
                        if (!RegExp(r"[a-z]").hasMatch(val!)) return 'Harus memiliki setidaknya 1 huruf kecil';
                        if (!RegExp(r"[A-Z]").hasMatch(val)) return 'Harus memiliki setidaknya 1 huruf besar';
                        if (!RegExp(r"[0-9]").hasMatch(val)) return 'Harus memiliki setidaknya 1 angka';
                        return null;
                      },
                    ]),
                  ),
                  verticalSpacer2,
                  CustomPasswordTextField(
                    controller: confirmationPasswordController,
                    obscureText: _confirmationPassVisible,
                    name: 'confirmation password',
                    hintText: 'Confirmation Password',
                    textInputAction: TextInputAction.next,
                    validators: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context, errorText: 'harus terisi'),
                      FormBuilderValidators.equal(context, passwordController.text,
                          errorText: 'tidak sama dengan password'),
                    ]),
                  ),
                  verticalSpacer4,
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: fourthBackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
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
                                    "DAFTAR",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                          ),
                        ),
                        onTap: () async {
                          if (!_isLoading) {
                            setState(() => _isLoading = true);

                            if (validateAndSave()) {
                              try {
                                await Provider.of<AuthProvider>(context, listen: false).register(
                                  noTelp: noHpController.text,
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  confirmationPassword: confirmationPasswordController.text,
                                  gender: _jenisKelamin,
                                  username: usernameController.text,
                                );
                                setState(() => _isLoading = false);

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) {
                                      return const LoginPage();
                                    },
                                  ),
                                );
                                Fluttertoast.showToast(
                                  msg: 'Berhasil Mendaftar. Silahkan Login.',
                                  backgroundColor: Colors.white,
                                  textColor: Colors.black,
                                );
                              } on HttpException catch (err) {
                                setState(() => _isLoading = false);
                                Fluttertoast.showToast(
                                  msg: err.toString(),
                                  backgroundColor: Colors.red,
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
            ),
          ),
        ),
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
