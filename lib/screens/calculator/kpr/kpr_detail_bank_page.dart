import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skripsi_raymond/constant.dart';
import 'package:skripsi_raymond/models/kpr_result.dart';
import 'package:skripsi_raymond/screens/calculator/kpr/kpr_submit_page.dart';
import 'package:skripsi_raymond/widgets/custom_app_bar.dart';
import 'package:skripsi_raymond/widgets/custom_card.dart';
import 'package:skripsi_raymond/widgets/product_card.dart';

class KprDetailBankPage extends StatelessWidget {
  final KprResultModel data;

  const KprDetailBankPage({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 20,
          bottom: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductCard(
                image: data.image,
                bankName: data.bankName,
                tenor: data.tenor,
                type: data.type,
                bunga: data.bunga,
                unit: data.unit,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => const KprSubmitPage(),
                    ),
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
                children: const [
                  TableRow(
                    decoration: BoxDecoration(color: Colors.white),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('Pinjaman'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('Tenor (Bulan)'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('Suku Bunga'),
                      ),
                    ],
                  ),
                  TableRow(
                    decoration: BoxDecoration(color: secondaryBackground),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '2 jt - 20 Jt',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '6 - 20',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '1%',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpacer5,
              const Text(
                'Perkenalan Produk',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              verticalSpacer2,
              CustomCard(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 10,
                    bottom: 20,
                  ),
                  child: const Text(
                    'BANK BERDIRI SEJAK 2020',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              verticalSpacer3,
              const Text(
                'Biaya',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              verticalSpacer2,
              const Text(
                '- Admin Rp 10.000',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              verticalSpacer3,
              const Text(
                'Dokumen yang diperlukan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              verticalSpacer2,
              const Text(
                '- Surat Ket Kerja',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
