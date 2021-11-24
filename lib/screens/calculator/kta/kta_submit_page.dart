import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skripsi_raymond/constant.dart';
import 'package:skripsi_raymond/widgets/custom_app_bar.dart';
import 'package:skripsi_raymond/widgets/custom_button.dart';
import 'package:skripsi_raymond/widgets/custom_card.dart';

class KtaSubmitPage extends StatelessWidget {
  const KtaSubmitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leadingWidth: 0,
        leading: const SizedBox(),
        title: const CustomAppBar('UPLOAD DOCUMENT'),
        elevation: 0,
        backgroundColor: primaryBackground,
      ),
      body: Container(
        color: primaryBackground,
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 20,
          bottom: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCard(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'KTP',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        'assets/images/logo-ojk.png',
                        width: double.infinity,
                        height: 100,
                      ),
                      verticalSpacer4,
                      const CustomButton(
                        buttonText: 'UPLOAD',
                        toastMsg: 'Berhasil Upload KTP',
                        color: secondaryBackground,
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpacer2,
              CustomCard(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'KK',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        'assets/images/logo-ojk.png',
                        width: double.infinity,
                        height: 100,
                      ),
                      verticalSpacer4,
                      const CustomButton(
                        buttonText: 'UPLOAD',
                        toastMsg: 'Berhasil Upload KTP',
                        color: secondaryBackground,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
