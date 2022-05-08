import 'package:skripsi_raymond/models/bank.dart';

class KprResultModel {
  final double hargaRumah;
  final double tenor;
  final double interest;
  final double cicilan;
  final double dp;
  final List<KprProductModel> kprProduct;

  KprResultModel({
    required this.tenor,
    required this.cicilan,
    required this.interest,
    required this.dp,
    required this.hargaRumah,
    required this.kprProduct,
  });
}

class KprProductModel {
  final int? id;
  final int? bankId;
  final String? pengenalan;
  final String? prosesAplikasi;
  final String? syaratPengajuan;
  final String? dokumenDiperlukan;
  final String? note;
  final List<KprInterestModel>? kprInterest;
  final BankModel? bank;

  KprProductModel({
    this.id,
    this.bankId,
    this.pengenalan,
    this.prosesAplikasi,
    this.syaratPengajuan,
    this.dokumenDiperlukan,
    this.note,
    this.kprInterest,
    this.bank,
  });
}

class KprInterestModel {
  final int? id;
  final int? kprId;
  final double? pinjamanMin;
  final double? pinjamanMax;
  final double? tenorMin;
  final double? tenorMax;
  final double? sukuBunga;

  KprInterestModel({
    this.id,
    this.kprId,
    this.pinjamanMin,
    this.pinjamanMax,
    this.tenorMin,
    this.tenorMax,
    this.sukuBunga,
  });
}
