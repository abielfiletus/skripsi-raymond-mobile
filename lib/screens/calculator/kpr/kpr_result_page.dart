import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:skripsi_raymond/constant.dart';
import 'package:skripsi_raymond/models/kpr_result.dart';
import 'package:skripsi_raymond/screens/calculator/kpr/kpr_detail_bank_page.dart';
import 'package:skripsi_raymond/screens/calculator/kpr/kpr_submit_page.dart';
import 'package:skripsi_raymond/widgets/bottom_navbar.dart';
import 'package:skripsi_raymond/widgets/custom_app_bar.dart';
import 'package:skripsi_raymond/widgets/custom_card.dart';
import 'package:skripsi_raymond/widgets/product_card_action.dart';

class KprResultPage extends StatelessWidget {
  final KprResultModel data;
  const KprResultPage(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leadingWidth: 0,
        leading: const SizedBox(),
        title: const CustomAppBar('CALCULATOR'),
        elevation: 0,
        backgroundColor: primaryBackground,
      ),
      body: Container(
        color: primaryBackground,
        width: double.infinity,
        padding: const EdgeInsets.only(top: 25, bottom: 10, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Pembayaran Per Bulan'),
                  Text(currency.format(data.cicilan), style: const TextStyle(color: dangerColor, fontSize: 20)),
                  verticalSpacer3,
                  const Divider(color: Colors.black38, thickness: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Harga Rumah', style: TextStyle(color: Colors.black54)),
                          Text('Tenor', style: TextStyle(color: Colors.black54)),
                          Text('Suku Bunga Pinjaman', style: TextStyle(color: Colors.black54)),
                          Text('DP', style: TextStyle(color: Colors.black54)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(currency.format(data.hargaRumah)),
                          Text('${data.tenor.toStringAsFixed(0)} Tahun'),
                          Text('${data.interest * 100} % / Tahun'),
                          Text('${data.dp * 100} %'),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            verticalSpacer3,
            const Text('Rekomendasi Produk', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            verticalSpacer3,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (final data in data.kprProduct)
                      ProductCardAction(
                        image: data.bank!.logo ?? '',
                        bankName: data.bank!.name ?? '',
                        tenor:
                            '${data.kprInterest![0].tenorMin!.toStringAsFixed(0)} - ${data.kprInterest![0].tenorMax!.toStringAsFixed(0)}',
                        type: 'KPR',
                        bunga: data.kprInterest![0].sukuBunga.toString(),
                        unit: 'Tahun',
                        onDetailTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (ctx) => KprDetailBankPage(data: data)),
                          );
                        },
                        onSubmitTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (ctx) => const KprSubmitPage()),
                          );
                        },
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavbar('calculator'),
    );
  }
}
