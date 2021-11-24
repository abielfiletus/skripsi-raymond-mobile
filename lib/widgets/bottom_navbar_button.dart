import 'package:flutter/material.dart';
import 'package:skripsi_raymond/constant.dart';

class BottomNavbarButton extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final bool active;
  final Function() onPress;

  const BottomNavbarButton({
    required this.text,
    required this.fontWeight,
    required this.active,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: active
              ? const BorderSide(color: secondaryBackground, width: 3)
              : const BorderSide(color: Colors.transparent),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: Colors.black12,
          child: Container(
            decoration: const BoxDecoration(color: Colors.transparent),
            padding: EdgeInsets.only(
              top: active ? 7.0 : 10.0,
              bottom: 10.0,
              left: 15.0,
              right: 15.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: fontWeight,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: 2,
              ),
            ),
          ),
          onTap: active ? () {} : onPress,
        ),
      ),
    );
  }
}
