import 'package:flutter/material.dart';
import 'package:skripsi_raymond/widgets/icon_button.dart';

class CustomDialog extends StatelessWidget {
  final Widget content;
  const CustomDialog({required this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 300,
              height: 315,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: content,
            ),
            Positioned(
              right: -15,
              top: -20,
              child: CustomIconButton(
                onTap: () => Navigator.pop(context),
                padding: 12,
                backgroundColor: Colors.white,
                icon: const Icon(Icons.close),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
