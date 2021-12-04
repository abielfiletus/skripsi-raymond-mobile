import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Icon icon;
  final void Function()? onTap;
  final Color? backgroundColor;
  final double? padding;

  const CustomIconButton({
    required this.icon,
    this.onTap,
    this.padding,
    this.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: backgroundColor ?? Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        padding: EdgeInsets.all(padding ?? 15),
        child: icon,
      ),
      onTap: onTap,
    );
  }
}
