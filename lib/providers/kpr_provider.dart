import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:skripsi_raymond/constant.dart' as constant;
import 'package:skripsi_raymond/models/bank.dart';
import 'package:skripsi_raymond/models/kpr_result.dart';
import 'package:skripsi_raymond/utils/http_exception.dart';

class KprResultProvider extends ChangeNotifier {
  Dio dio = Dio();
  List<KprResultModel> _kprResultModel = [];
  List<KprProductModel> _kprProductModel = [];

  List<KprResultModel> get kprResult {
    return [..._kprResultModel];
  }

  List<KprProductModel> get kprProductResult {
    return [..._kprProductModel];
  }

  Future<KprResultModel> getKprResult({
    required String token,
    required double hargaRumah,
    required double tenor,
    required double interest,
    required double dp,
  }) async {
    try {
      final res = await dio.get(
        'http://' + constant.apiUrl + '/api/kpr/recommendation/calculator',
        queryParameters: {'harga_rumah': hargaRumah, 'tenor': tenor, 'bunga': interest / 100, 'dp': dp / 100},
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
      final List<KprProductModel> loadedKprProduct = [];

      for (final product in data['bank']) {
        final List<KprInterestModel> loadedKprInterest = [];

        for (final interest in product['kpr_interest']) {
          loadedKprInterest.add(KprInterestModel(
            id: interest['id'],
            kprId: interest['kpr_id'],
            pinjamanMax: interest['pinjaman_max'] + .0,
            pinjamanMin: interest['pinjaman_min'] + .0,
            sukuBunga: interest['suku_bunga'] + .0,
            tenorMax: interest['tenor_max'] + .0,
            tenorMin: interest['tenor_min'] + .0,
          ));
        }
        loadedKprProduct.add(KprProductModel(
          id: product['id'],
          bankId: product['bank_id'],
          dokumenDiperlukan: product['dokumen_diperlukan'],
          note: product['note'],
          pengenalan: product['pengenalan'],
          prosesAplikasi: product['proses_aplikasi'],
          kprInterest: loadedKprInterest,
          bank: BankModel(
            description: product['bank']['description'],
            id: product['bank']['id'],
            logo: product['bank']['logo'],
            name: product['bank']['name'],
          ),
        ));
      }

      return KprResultModel(
        cicilan: data['cicilan'] + .0,
        interest: data['interest'] + .0,
        hargaRumah: data['harga_rumah'] + .0,
        tenor: data['tenor'] + .0,
        dp: data['dp'] + .0,
        kprProduct: loadedKprProduct,
      );
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future<void> getAllKprData(String token) async {
    try {
      final res = await dio.get(
        'http://' + constant.apiUrl + '/api/kpr',
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
      final List<KprProductModel> loadedKprProduct = [];

      for (final product in data) {
        final List<KprInterestModel> loadedKprInterest = [];
        for (final interest in product['kpr_interest']) {
          loadedKprInterest.add(KprInterestModel(
            id: interest['id'],
            kprId: interest['kpr_id'],
            pinjamanMax: interest['pinjaman_max'] + .0,
            pinjamanMin: interest['pinjaman_min'] + .0,
            sukuBunga: interest['suku_bunga'] + .0,
            tenorMax: interest['tenor_max'] + .0,
            tenorMin: interest['tenor_min'] + .0,
          ));
        }
        loadedKprProduct.add(KprProductModel(
          id: product['id'],
          bankId: product['bank_id'],
          dokumenDiperlukan: product['dokumen_diperlukan'],
          note: product['note'],
          pengenalan: product['pengenalan'],
          prosesAplikasi: product['proses_aplikasi'],
          kprInterest: loadedKprInterest,
          bank: BankModel(
            description: product['bank']['description'],
            id: product['bank']['id'],
            logo: product['bank']['logo'],
            name: product['bank']['name'],
          ),
        ));
      }

      _kprProductModel = loadedKprProduct;
      notifyListeners();
    } catch (err) {
      rethrow;
    }
  }
}
