import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:skripsi_raymond/constant.dart' as constant;
import 'package:skripsi_raymond/models/banner.dart';
import 'package:skripsi_raymond/utils/http_exception.dart';

class BannerProvider extends ChangeNotifier {
  Dio dio = Dio();
  List<BannerModel> _bannerModel = [];

  List<BannerModel> get banner {
    return [..._bannerModel];
  }

  Future<void> getBanner(String token) async {
    try {
      final res = await dio.get(
        'http://' + constant.apiUrl + '/api/banner',
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
      final List<BannerModel> loadedBanner = [];

      for (final item in data) {
        loadedBanner.add(BannerModel(
          id: item['id'],
          description: item['description'],
          image: item['image'],
          title: item['title'],
        ));
      }

      _bannerModel = loadedBanner;
      notifyListeners();
    } catch (err) {
      rethrow;
    }
  }
}
