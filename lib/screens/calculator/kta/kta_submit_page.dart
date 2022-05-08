import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skripsi_raymond/constant.dart';
import 'package:skripsi_raymond/screens/calculator/upload_modal.dart';
import 'package:skripsi_raymond/widgets/custom_app_bar.dart';
import 'package:skripsi_raymond/widgets/custom_button.dart';
import 'package:skripsi_raymond/widgets/custom_card.dart';

class KtaSubmitPage extends StatefulWidget {
  const KtaSubmitPage({Key? key}) : super(key: key);

  @override
  _KtaSubmitPageState createState() => _KtaSubmitPageState();
}

class _KtaSubmitPageState extends State<KtaSubmitPage> {
  File? ktpFile;
  File? kkFile;
  File? skjFile;

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
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
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
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      verticalSpacer2,
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: ktpFile != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  ktpFile!,
                                  width: double.infinity,
                                  height: 200.0,
                                  fit: BoxFit.fitHeight,
                                ),
                              )
                            : Container(
                                width: double.infinity,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(Icons.camera_alt, color: Colors.white),
                              ),
                      ),
                      verticalSpacer4,
                      CustomButton(
                        buttonText: 'UPLOAD',
                        toastMsg: 'Berhasil Upload KTP',
                        color: secondaryBackground,
                        nextRoute: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (ctx, _, __) => UploadModal(
                                onChange: (file) => setState(() => ktpFile = file),
                                image: ktpFile != null ? ktpFile!.path : '',
                              ),
                            ),
                          );
                        },
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
                        'Kartu Keluarga',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      verticalSpacer2,
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: kkFile != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  kkFile!,
                                  width: double.infinity,
                                  height: 200.0,
                                  fit: BoxFit.fitHeight,
                                ),
                              )
                            : Container(
                                width: double.infinity,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(Icons.camera_alt, color: Colors.white),
                              ),
                      ),
                      verticalSpacer4,
                      CustomButton(
                        buttonText: 'UPLOAD',
                        toastMsg: 'Berhasil Upload Kartu Keluarga',
                        color: secondaryBackground,
                        nextRoute: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (ctx, _, __) => UploadModal(
                                onChange: (file) => setState(() => kkFile = file),
                                image: kkFile != null ? kkFile!.path : '',
                              ),
                            ),
                          );
                        },
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
                        'Surat Keterangan Kerja',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      verticalSpacer2,
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: skjFile != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  skjFile!,
                                  width: double.infinity,
                                  height: 200.0,
                                  fit: BoxFit.fitHeight,
                                ),
                              )
                            : Container(
                                width: double.infinity,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(Icons.camera_alt, color: Colors.white),
                              ),
                      ),
                      verticalSpacer4,
                      CustomButton(
                        buttonText: 'UPLOAD',
                        toastMsg: 'Berhasil Upload Surat Keterangan Kerja',
                        color: secondaryBackground,
                        nextRoute: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (ctx, _, __) => UploadModal(
                                onChange: (file) => setState(() => skjFile = file),
                                image: skjFile != null ? skjFile!.path : '',
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpacer7,
              CustomButton(
                buttonText: 'KIRIM',
                toastMsg: 'Berhasil Mengajukan KTA',
                color: secondaryBackground,
                nextRoute: () {
                  if (ktpFile == null || kkFile == null || skjFile == null) {
                    throw 'Pastikan seluruh dokumen sudah terupload';
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
              verticalSpacer3,
            ],
          ),
        ),
      ),
    );
  }
}
