import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skripsi_raymond/constant.dart';
import 'package:skripsi_raymond/models/kta_result.dart';
import 'package:skripsi_raymond/screens/calculator/kta/kta_submit_page.dart';
import 'package:skripsi_raymond/utils/currency_text.dart';
import 'package:skripsi_raymond/widgets/custom_app_bar.dart';
import 'package:skripsi_raymond/widgets/product_card.dart';

class KtaDetailBankPage extends StatelessWidget {
  final KtaProductModel data;

  const KtaDetailBankPage({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pinjamanMax = CurrencyText().format(data.ktaInterest![0].pinjamanMax ?? 0);
    final pinjamanMin = CurrencyText().format(data.ktaInterest![0].pinjamanMin ?? 0);
    final tenorMin = data.ktaInterest![0].tenorMin!.toStringAsFixed(0);
    final tenorMax = data.ktaInterest![0].tenorMax!.toStringAsFixed(0);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leadingWidth: 0,
        leading: const SizedBox(),
        title: const CustomAppBar('LIHAT DETAIL'),
        elevation: 0,
        backgroundColor: primaryBackground,
      ),
      body: Container(
        color: primaryBackground,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductCard(
                image: data.bank!.logo ?? '',
                bankName: data.bank!.name ?? '',
                tenor: '${data.ktaInterest![0].tenorMin} - ${data.ktaInterest![0].tenorMax}',
                type: 'KTA',
                bunga: data.ktaInterest![0].sukuBunga.toString(),
                unit: 'Bulan',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (ctx) => const KtaSubmitPage()),
                  );
                },
              ),
              verticalSpacer4,
              const Text(
                'Kalkulasi Bunga',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              verticalSpacer2,
              Table(
                children: [
                  const TableRow(
                    decoration: BoxDecoration(color: Colors.white),
                    children: [
                      Padding(padding: EdgeInsets.all(8), child: Text('Pinjaman')),
                      Padding(padding: EdgeInsets.all(8), child: Text('Tenor (Bulan)')),
                      Padding(padding: EdgeInsets.all(8), child: Text('Suku Bunga')),
                    ],
                  ),
                  TableRow(
                    decoration: const BoxDecoration(color: secondaryBackground),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text('$pinjamanMin - $pinjamanMax', style: const TextStyle(color: Colors.white)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text('$tenorMin - $tenorMax', style: const TextStyle(color: Colors.white)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text('${data.ktaInterest![0].sukuBunga}%', style: const TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpacer5,
              const Text(
                'Biaya',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              verticalSpacer2,
              Text(
                data.biaya ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              verticalSpacer3,
              const Text(
                'Syarat Pengajuan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              verticalSpacer2,
              Text(
                data.syaratPengajuan ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              verticalSpacer3,
              const Text(
                'Dokumen yang diperlukan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              verticalSpacer2,
              Text(
                data.dokumenDiperlukan ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
