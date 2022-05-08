import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skripsi_raymond/constant.dart' as constant;
import 'package:skripsi_raymond/utils/http_exception.dart';
import 'package:skripsi_raymond/utils/preference.dart';

class AuthProvider extends ChangeNotifier {
  final formatter = DateFormat('yyyy-MM-dd');
  Dio dio = Dio();

  Future<void> login(String email, String pass) async {
    try {
      final res = await dio.post(
        'http://' + constant.apiUrl + '/api/auth/login',
        data: {"email": email, "password": pass},
        options: Options(
          responseType: ResponseType.json,
          contentType: 'application/json',
          validateStatus: (status) => status! < 500,
        ),
      );

      final bool status = res.data['status'];

      if (!status) {
        throw HttpException('Kombinasi email dan password tidak sesuai.');
      }

      final data = res.data['data'];

      if (data == null) {
        throw HttpException('Kombinasi email dan password tidak sesuai.');
      }

      Preferences.isLogin = true;
      Preferences.email = data['email'];
      Preferences.avatar = data['avatar'] ?? '';
      Preferences.firstName = data['first_name'];
      Preferences.lastName = data['last_name'];
      Preferences.username = data['username'];
      Preferences.noTelp = data['no_telp'] ?? '';
      Preferences.token = data['token'];
      Preferences.idUser = data['id'];

      notifyListeners();
    } catch (err) {
      rethrow;
    }
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String noTelp,
    required String password,
    required String confirmationPassword,
    required String gender,
    required String username,
  }) async {
    try {
      final res = await dio.post(
        'http://' + constant.apiUrl + '/api/auth/register',
        data: {
          'first_name': firstName,
          'last_name': lastName,
          'username': username,
          'no_telp': noTelp,
          'email': email,
          'password': password,
          'confirmation_password': confirmationPassword,
          'gender': gender,
        },
        options: Options(
          responseType: ResponseType.json,
          contentType: 'application/json',
          validateStatus: (status) => status! < 500,
        ),
      );
      print(res.data);
      final bool status = res.data['status'];
      if (!status) {
        throw HttpException(res.data['err'].toString().replaceAll(RegExp(r'[\{\}\:]'), ''));
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<void> updateUser({
    String? firstName,
    String? lastName,
    String? email,
    String? noTelp,
    File? avatar,
  }) async {
    FormData formdata = FormData.fromMap({
      'first_name': firstName,
      'last_name': lastName,
      'no_telp': noTelp,
      'email': email,
      'avatar': avatar != null ? [await MultipartFile.fromFile(avatar.path)] : ''
    });

    return doUpdate(formdata);
  }

  Future<void> updatePassword(String password) async {
    return doUpdate({
      'first_name': Preferences.firstName,
      'last_name': Preferences.lastName,
      'no_telp': Preferences.noTelp,
      'email': Preferences.email,
      'password': password
    });
  }

  Future<void> logout() async {
    try {
      Preferences.destroy();
    } catch (err) {
      rethrow;
    }
  }

  Future<void> doUpdate(jsonData) async {
    try {
      final res = await dio.put(
        'http://' + constant.apiUrl + '/api/user/${Preferences.idUser}',
        data: jsonData,
        options: Options(
          responseType: ResponseType.json,
          headers: {"Content-type": "application/json", "Authorization": "Bearer ${Preferences.token}"},
          validateStatus: (status) => status! < 510,
        ),
      );

      final dynamic response = res.data;
      final bool status = response['status'];

      if (!status) throw HttpException(response['error']);
      final dynamic data = response['data'];

      Preferences.email = data['email'];
      Preferences.avatar = data['avatar'] ?? '';
      Preferences.firstName = data['first_name'];
      Preferences.lastName = data['last_name'];
      Preferences.username = data['username'];
      Preferences.noTelp = data['no_telp'] ?? '';

      notifyListeners();
    } catch (err) {
      rethrow;
    }
  }
}
