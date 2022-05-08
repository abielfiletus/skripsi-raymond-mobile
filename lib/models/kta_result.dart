import 'package:skripsi_raymond/models/bank.dart';

class KtaResultModel {
  final double pinjaman;
  final double tenor;
  final double interest;
  final double cicilan;
  final List<KtaProductModel> ktaProduct;

  KtaResultModel({
    required this.tenor,
    required this.cicilan,
    required this.interest,
    required this.pinjaman,
    required this.ktaProduct,
  });
}

class KtaProductModel {
  final int? id;
  final int? bankId;
  final String? pengenalan;
  final String? prosesAplikasi;
  final String? biaya;
  final String? syaratPengajuan;
  final String? dokumenDiperlukan;
  final String? note;
  final List<KtaInterestModel>? ktaInterest;
  final BankModel? bank;

  KtaProductModel({
    this.id,
    this.bankId,
    this.pengenalan,
    this.prosesAplikasi,
    this.biaya,
    this.syaratPengajuan,
    this.dokumenDiperlukan,
    this.note,
    this.ktaInterest,
    this.bank,
  });
}

class KtaInterestModel {
  final int? id;
  final int? ktaId;
  final double? pinjamanMin;
  final double? pinjamanMax;
  final double? tenorMin;
  final double? tenorMax;
  final double? sukuBunga;

  KtaInterestModel({
    this.id,
    this.ktaId,
    this.pinjamanMin,
    this.pinjamanMax,
    this.tenorMin,
    this.tenorMax,
    this.sukuBunga,
  });
}
