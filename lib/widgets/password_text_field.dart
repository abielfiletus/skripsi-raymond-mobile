import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomPasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String name;
  final String hintText;
  final String? Function(String?)? validators;
  final TextInputAction? textInputAction;

  const CustomPasswordTextField({
    required this.controller,
    required this.obscureText,
    required this.name,
    required this.hintText,
    this.validators,
    this.textInputAction,
    Key? key,
  }) : super(key: key);

  @override
  _CustomPasswordTextFieldState createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _showPassword = false;

  @override
  void initState() {
    _showPassword = widget.obscureText;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      textInputAction: widget.textInputAction,
      controller: widget.controller,
      obscureText: _showPassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        suffixIcon: IconButton(
          icon: _showPassword
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
          onPressed: () {
            setState(() => _showPassword = !_showPassword);
          },
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black12,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black26,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      validator: widget.validators,
    );
  }
}
