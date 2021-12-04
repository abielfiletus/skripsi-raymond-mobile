import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:skripsi_raymond/widgets/custom_button.dart';
import 'package:skripsi_raymond/widgets/dialog.dart';
import 'package:skripsi_raymond/widgets/password_text_field.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormBuilderState> globalFormKey = GlobalKey<FormBuilderState>();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmationPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      content: FormBuilder(
        key: globalFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Ubah Password', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            CustomPasswordTextField(
              controller: oldPasswordController,
              obscureText: true,
              name: 'old password',
              hintText: 'Old Password',
              textInputAction: TextInputAction.next,
              validators: FormBuilderValidators.compose([
                FormBuilderValidators.required(context, errorText: 'harus terisi'),
                FormBuilderValidators.minLength(context, 6, errorText: 'minimal 6 karakter'),
              ]),
            ),
            CustomPasswordTextField(
              controller: passwordController,
              obscureText: true,
              name: 'password',
              hintText: 'Password',
              textInputAction: TextInputAction.next,
              validators: FormBuilderValidators.compose([
                FormBuilderValidators.required(context, errorText: 'harus terisi'),
                FormBuilderValidators.minLength(context, 6, errorText: 'minimal 6 karakter'),
              ]),
            ),
            CustomPasswordTextField(
              controller: confirmationPasswordController,
              obscureText: true,
              name: 'confirmation password',
              hintText: 'Confirmation Password',
              textInputAction: TextInputAction.next,
              validators: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                  context,
                  errorText: 'harus terisi',
                ),
                (val) {
                  if (passwordController.text != val) return 'tidak sama dengan password';
                  return null;
                },
              ]),
            ),
            CustomButton(
              buttonText: 'Simpan',
              toastMsg: 'Berhasil Mengubah Password',
              validateFunction: validateAndSave,
            ),
          ],
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
