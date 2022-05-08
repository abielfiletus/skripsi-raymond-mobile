import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_raymond/constant.dart';
import 'package:skripsi_raymond/providers/auth_provider.dart';
import 'package:skripsi_raymond/screens/profile/profile_page.dart';
import 'package:skripsi_raymond/widgets/custom_button.dart';
import 'package:skripsi_raymond/widgets/dialog.dart';

class ChangeAvatar extends StatefulWidget {
  final String avatar;
  final String? title;
  const ChangeAvatar({required this.avatar, this.title, Key? key}) : super(key: key);

  @override
  _ChangeAvatarState createState() => _ChangeAvatarState();
}

class _ChangeAvatarState extends State<ChangeAvatar> {
  File? _image;
  final imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      content: Column(
        children: [
          Text(widget.title ?? 'Ubah Gambar', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                  child: Stack(
                    children: [
                      _image != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                _image!,
                                width: 200.0,
                                height: 200.0,
                                fit: BoxFit.fitHeight,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                widget.avatar,
                                width: 200,
                                height: 200,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.camera_alt, color: Colors.white),
                      )
                    ],
                  )),
            ),
          ),
          verticalSpacer4,
          CustomButton(
            buttonText: 'Simpan',
            toastMsg: 'Berhasil mengubah gambar',
            nextRoute: () async {
              await Provider.of<AuthProvider>(context, listen: false).updateUser(avatar: _image);
              Navigator.pop(context);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => const ProfilePage()));
            },
          ),
        ],
      ),
    );
  }
}
