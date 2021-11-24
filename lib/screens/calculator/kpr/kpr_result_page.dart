import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:skripsi_raymond/constant.dart';
import 'package:skripsi_raymond/models/kpr_result.dart';
import 'package:skripsi_raymond/screens/calculator/kpr/kpr_detail_bank_page.dart';
import 'package:skripsi_raymond/widgets/bottom_navbar.dart';
import 'package:skripsi_raymond/widgets/custom_app_bar.dart';
import 'package:skripsi_raymond/widgets/custom_card.dart';
import 'package:skripsi_raymond/widgets/product_card_action.dart';

class KprResultPage extends StatelessWidget {
  const KprResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.only(
          top: 25,
          bottom: 10,
          left: 10,
          right: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Pembayaran Per Bulan'),
                  const Text(
                    'Rp x.xxx.xxx',
                    style: TextStyle(
                      color: dangerColor,
                      fontSize: 20,
                    ),
                  ),
                  verticalSpacer3,
                  const Divider(color: Colors.black38, thickness: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Harga Rumah',
                            style: TextStyle(color: Colors.black54),
                          ),
                          Text(
                            'Tenor',
                            style: TextStyle(color: Colors.black54),
                          ),
                          Text(
                            'Suku Bunga Pinjaman',
                            style: TextStyle(color: Colors.black54),
                          ),
                          Text(
                            'DP',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text('Rp xxx.xxx.xxx'),
                          Text('xx Tahun'),
                          Text('x.xx % / Tahun'),
                          Text('x %'),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            verticalSpacer3,
            const Text(
              'Rekomendasi Produk',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            verticalSpacer3,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (var data in KprResultModel.list)
                      ProductCardAction(
                        image: data.image,
                        bankName: data.bankName,
                        tenor: data.tenor,
                        type: data.type,
                        bunga: data.bunga,
                        unit: data.unit,
                        onDetailTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => KprDetailBankPage(data: data),
                            ),
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
