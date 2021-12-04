import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:skripsi_raymond/constant.dart' as constant;
import 'package:skripsi_raymond/models/berita.dart';
import 'package:skripsi_raymond/utils/http_exception.dart';

class BeritaProvider extends ChangeNotifier {
  Dio dio = Dio();
  List<BeritaModel> _beritaModel = [];

  List<BeritaModel> get berita {
    return [..._beritaModel];
  }

  Future<void> getBerita(String token) async {
    try {
      final res = await dio.get(
        'http://' + constant.apiUrl + '/api/berita',
        options: Options(
          responseType: ResponseType.json,
          validateStatus: (status) => status! < 500,
          headers: {"Content-type": "application/json", "Authorization": "Bearer $token"},
        ),
      );

      if (!res.data['status']) {
        throw HttpException('Terdapat kesalahan sistem. Silahkan Coba kembali');
      }

      final data = res.data['data'];
      final List<BeritaModel> loadedBerita = [];

      for (final item in data) {
        loadedBerita.add(BeritaModel(
          id: item['id'],
          link: item['link'],
          image: item['image'],
          title: item['title'],
        ));
      }

      _beritaModel = loadedBerita;
      notifyListeners();
    } catch (err) {
      rethrow;
    }
  }
}
