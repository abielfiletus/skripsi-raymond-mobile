import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skripsi_raymond/constant.dart';
import 'package:skripsi_raymond/widgets/custom_button.dart';
import 'package:skripsi_raymond/widgets/dialog.dart';

class UploadModal extends StatefulWidget {
  final String? image;
  final Function(File file) onChange;
  const UploadModal({this.image, required this.onChange, Key? key}) : super(key: key);

  @override
  _UploadModalState createState() => _UploadModalState();
}

class _UploadModalState extends State<UploadModal> {
  File? _image;
  final imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      content: Column(
        children: [
          const Text('Upload Gambar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          verticalSpacer3,
          Center(
            child: GestureDetector(
              onTap: () async {
                XFile? image = await imagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50);
                if (image != null) {
                  setState(() => _image = File(image.path));
                }
              },
              child: Container(
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
                  child: _image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            _image!,
                            width: 200.0,
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
                        )),
            ),
          ),
          verticalSpacer4,
          CustomButton(
            buttonText: 'Simpan',
            toastMsg: 'Berhasil mengupload gambar',
            nextRoute: () {
              if (_image != null) widget.onChange(_image!);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
