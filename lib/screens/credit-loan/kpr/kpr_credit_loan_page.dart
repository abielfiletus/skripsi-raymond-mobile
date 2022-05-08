import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_raymond/providers/kpr_provider.dart';
import 'package:skripsi_raymond/screens/calculator/kpr/kpr_detail_bank_page.dart';
import 'package:skripsi_raymond/screens/calculator/kpr/kpr_submit_page.dart';
import 'package:skripsi_raymond/utils/preference.dart';
import 'package:skripsi_raymond/widgets/loading.dart';
import 'package:skripsi_raymond/widgets/product_card_action.dart';

class KprCreditLoanPage extends StatefulWidget {
  const KprCreditLoanPage({Key? key}) : super(key: key);

  @override
  _KprCreditLoanPageState createState() => _KprCreditLoanPageState();
}

class _KprCreditLoanPageState extends State<KprCreditLoanPage> {
  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<KprResultProvider>(context, listen: false)
        .getAllKprData(Preferences.token)
        .then((_) => setState(() => loading = false));
  }

  @override
  Widget build(BuildContext context) {
    final kprProductData = Provider.of<KprResultProvider>(context, listen: false).kprProductResult;

    return loading
        ? const CustomLoading()
        : SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (final data in kprProductData)
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
                          MaterialPageRoute(builder: (ctx) => KprDetailBankPage(data: data, showAll: true)),
                        );
                      },
                      onSubmitTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (ctx) => const KprSubmitPage()),
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
