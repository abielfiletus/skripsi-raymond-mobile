import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:skripsi_raymond/constant.dart' as constant;
import 'package:skripsi_raymond/models/bank.dart';
import 'package:skripsi_raymond/models/kta_result.dart';
import 'package:skripsi_raymond/utils/http_exception.dart';

class KtaResultProvider extends ChangeNotifier {
  Dio dio = Dio();
  List<KtaResultModel> _ktaResultModel = [];
  List<KtaProductModel> _ktaProductModel = [];

  List<KtaResultModel> get ktaResult {
    return [..._ktaResultModel];
  }

  List<KtaProductModel> get ktaProductResult {
    return [..._ktaProductModel];
  }

  Future<KtaResultModel> getKtaResult({
    required String token,
    required double pinjaman,
    required double tenor,
    required double interest,
  }) async {
    try {
      final res = await dio.get(
        'http://' + constant.apiUrl + '/api/kta/recommendation/calculator',
        queryParameters: {'pinjaman': pinjaman, 'tenor': tenor, 'bunga': interest / 100},
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
      final List<KtaProductModel> loadedKtaProduct = [];

      for (final product in data['bank']) {
        final List<KtaInterestModel> loadedKtaInterest = [];

        for (final interest in product['kta_interest']) {
          loadedKtaInterest.add(KtaInterestModel(
            id: interest['id'],
            ktaId: interest['kta_id'],
            pinjamanMax: interest['pinjaman_max'] + .0,
            pinjamanMin: interest['pinjaman_min'] + .0,
            sukuBunga: interest['suku_bunga'] + .0,
            tenorMax: interest['tenor_max'] + .0,
            tenorMin: interest['tenor_min'] + .0,
          ));
        }
        loadedKtaProduct.add(KtaProductModel(
          id: product['id'],
          bankId: product['bank_id'],
          biaya: product['biaya'],
          dokumenDiperlukan: product['dokumen_diperlukan'],
          note: product['note'],
          pengenalan: product['pengenalan'],
          prosesAplikasi: product['proses_aplikasi'],
          ktaInterest: loadedKtaInterest,
          bank: BankModel(
            description: product['bank']['description'],
            id: product['bank']['id'],
            logo: product['bank']['logo'],
            name: product['bank']['name'],
          ),
        ));
      }

      return KtaResultModel(
        cicilan: data['cicilan'] + .0,
        interest: data['interest'] + .0,
        pinjaman: data['pinjaman'] + .0,
        tenor: data['tenor'] + .0,
        ktaProduct: loadedKtaProduct,
      );
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future<void> getAllKtaData(String token) async {
    try {
      final res = await dio.get(
        'http://' + constant.apiUrl + '/api/kta',
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
      final List<KtaProductModel> loadedKtaProduct = [];

      for (final product in data) {
        final List<KtaInterestModel> loadedKtaInterest = [];
        for (final interest in product['kta_interest']) {
          loadedKtaInterest.add(KtaInterestModel(
            id: interest['id'],
            ktaId: interest['kta_id'],
            pinjamanMax: interest['pinjaman_max'] + .0,
            pinjamanMin: interest['pinjaman_min'] + .0,
            sukuBunga: interest['suku_bunga'] + .0,
            tenorMax: interest['tenor_max'] + .0,
            tenorMin: interest['tenor_min'] + .0,
          ));
        }
        loadedKtaProduct.add(KtaProductModel(
          id: product['id'],
          bankId: product['bank_id'],
          dokumenDiperlukan: product['dokumen_diperlukan'],
          note: product['note'],
          pengenalan: product['pengenalan'],
          prosesAplikasi: product['proses_aplikasi'],
          ktaInterest: loadedKtaInterest,
          bank: BankModel(
            description: product['bank']['description'],
            id: product['bank']['id'],
            logo: product['bank']['logo'],
            name: product['bank']['name'],
          ),
        ));
      }

      _ktaProductModel = loadedKtaProduct;
      notifyListeners();
    } catch (err) {
      rethrow;
    }
  }
}
