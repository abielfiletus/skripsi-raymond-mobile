import 'package:flutter/material.dart';
import 'package:skripsi_raymond/constant.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      width: double.infinity,
      child: Column(
        children: const [
          CircularProgressIndicator(),
          verticalSpacer2,
          Text('Memuat Data'),
        ],
      ),
    );
  }
}
