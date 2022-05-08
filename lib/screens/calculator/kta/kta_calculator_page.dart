import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_raymond/constant.dart';
import 'package:skripsi_raymond/providers/kta_provider.dart';
import 'package:skripsi_raymond/screens/calculator/kta/kta_result_page.dart';
import 'package:skripsi_raymond/utils/preference.dart';
import 'package:skripsi_raymond/widgets/custom_button.dart';
import 'package:skripsi_raymond/widgets/custom_text_field.dart';

class KtaCalculatorPage extends StatefulWidget {
  const KtaCalculatorPage({Key? key}) : super(key: key);

  @override
  _KtaCalculatorPageState createState() => _KtaCalculatorPageState();
}

class _KtaCalculatorPageState extends State<KtaCalculatorPage> {
  final GlobalKey<FormBuilderState> globalFormKey = GlobalKey<FormBuilderState>();
  final TextEditingController pinjamanController = TextEditingController();
  final TextEditingController tenorController = TextEditingController();
  final TextEditingController sukuBungaController = TextEditingController();

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FormBuilder(
        key: globalFormKey,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: const Text('Jumlah Pinjaman'),
            ),
            verticalSpacer1,
            CustomTextField(
              name: 'jumlah pinjaman',
              controller: pinjamanController,
              keyboardType: TextInputType.number,
              hintText: 'Masukkan Angka',
              textInputAction: TextInputAction.next,
              suffix: 'Rupiah',
              validators: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                  context,
                  errorText: 'harus terisi',
                ),
              ]),
            ),
            verticalSpacer3,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: const Text('Tenor'),
            ),
            verticalSpacer1,
            CustomTextField(
              name: 'tenor',
              controller: tenorController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              hintText: 'Masukkan Angka',
              suffix: 'Bulan',
              validators: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                  context,
                  errorText: 'harus terisi',
                ),
              ]),
            ),
            verticalSpacer3,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: const Text('Suku Bunga Pinjaman'),
            ),
            verticalSpacer1,
            CustomTextField(
              name: 'suku bunga',
              controller: sukuBungaController,
              keyboardType: TextInputType.number,
              hintText: 'Masukkan Angka',
              suffix: '% / Bulan',
              validators: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                  context,
                  errorText: 'harus terisi',
                ),
              ]),
            ),
            verticalSpacer7,
            CustomButton(
              buttonText: 'HITUNG',
              validateFunction: validateAndSave,
              toastMsg: 'Berhasil Menghitung.',
              width: 100,
              color: secondaryBackground,
              nextRoute: () async {
                try {
                  final data = await Provider.of<KtaResultProvider>(context, listen: false).getKtaResult(
                    token: Preferences.token,
                    tenor: double.parse(tenorController.text),
                    pinjaman: double.parse(pinjamanController.text),
                    interest: double.parse(sukuBungaController.text),
                  );
                  final form = globalFormKey.currentState;
                  form!.reset();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => KtaResultPage(data),
                    ),
                  );
                } catch (err) {
                  Fluttertoast.showToast(
                    msg: 'Gagal menghitung dan mengambil rekomendasi',
                    backgroundColor: Colors.red,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
