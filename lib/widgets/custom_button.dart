import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skripsi_raymond/constant.dart';

class CustomButton extends StatefulWidget {
  final String buttonText;
  final Function? validateFunction;
  final String toastMsg;
  final Color? buttonTextColor;
  final Function? nextRoute;
  final double? height;
  final double? width;
  final Color? color;

  const CustomButton({
    required this.buttonText,
    required this.toastMsg,
    this.validateFunction,
    this.buttonTextColor,
    this.nextRoute,
    this.height,
    this.width,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 40,
      decoration: BoxDecoration(
        color: widget.color ?? thirdBackground,
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
                  ? Text(
                      "Mohon Tunggu...",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: widget.buttonTextColor ?? Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      widget.buttonText,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: widget.buttonTextColor ?? Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
            ),
          ),
          onTap: () async {
            if (!_isLoading) {
              setState(() => _isLoading = true);
              final test = widget.validateFunction != null ? widget.validateFunction!() : true;

              if (test) {
                try {
                  setState(() => _isLoading = false);
                  if (widget.nextRoute != null) {
                    await widget.nextRoute!();
                  }
                  Fluttertoast.showToast(
                    msg: widget.toastMsg,
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
                  print(err);
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
    );
  }
}
