import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_raymond/providers/kta_provider.dart';
import 'package:skripsi_raymond/screens/calculator/kta/kta_detail_bank_page.dart';
import 'package:skripsi_raymond/screens/calculator/kta/kta_submit_page.dart';
import 'package:skripsi_raymond/utils/preference.dart';
import 'package:skripsi_raymond/widgets/loading.dart';
import 'package:skripsi_raymond/widgets/product_card_action.dart';

class KtaCreditLoanPage extends StatefulWidget {
  const KtaCreditLoanPage({Key? key}) : super(key: key);

  @override
  _KtaCreditLoanPageState createState() => _KtaCreditLoanPageState();
}

class _KtaCreditLoanPageState extends State<KtaCreditLoanPage> {
  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<KtaResultProvider>(context, listen: false)
        .getAllKtaData(Preferences.token)
        .then((_) => setState(() => loading = false));
  }

  @override
  Widget build(BuildContext context) {
    final ktaProductData = Provider.of<KtaResultProvider>(context, listen: false).ktaProductResult;

    return loading
        ? const CustomLoading()
        : SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (final data in ktaProductData)
                    ProductCardAction(
                      image: data.bank!.logo ?? '',
                      bankName: data.bank!.name ?? '',
                      tenor:
                          '${data.ktaInterest![0].tenorMin!.toStringAsFixed(0)} - ${data.ktaInterest![0].tenorMax!.toStringAsFixed(0)}',
                      type: 'KTA',
                      bunga: data.ktaInterest![0].sukuBunga.toString(),
                      unit: 'Bulan',
                      onDetailTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (ctx) => KtaDetailBankPage(data: data, showAll: true)),
                        );
                      },
                      onSubmitTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (ctx) => const KtaSubmitPage()),
                        );
                      },
                      withTextField: true,
                    )
                ],
              ),
            ),
          );
  }
}
