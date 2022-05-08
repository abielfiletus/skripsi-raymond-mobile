import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextField extends StatelessWidget {
  final String name;
  final TextInputAction? textInputAction;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validators;
  final TextInputType? keyboardType;
  final String? suffix;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final bool? dense;

  const CustomTextField({
    required this.name,
    required this.controller,
    required this.hintText,
    this.textInputAction,
    this.validators,
    this.keyboardType,
    this.suffix,
    this.border,
    this.focusedBorder,
    this.textStyle,
    this.padding,
    this.dense,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: textStyle,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        suffixText: suffix,
        contentPadding: padding ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        isDense: dense,
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black12, width: 1.0),
              borderRadius: BorderRadius.circular(20),
            ),
        border: border ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(20),
            ),
        enabledBorder: border ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(20),
            ),
      ),
      validator: validators,
    );
  }
}
