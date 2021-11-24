import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:skripsi_raymond/constant.dart';
import 'package:skripsi_raymond/screens/calculator/kta/kta_result_page.dart';
import 'package:skripsi_raymond/widgets/custom_button.dart';
import 'package:skripsi_raymond/widgets/custom_text_field.dart';

class KtaCalculatorPage extends StatefulWidget {
  const KtaCalculatorPage({Key? key}) : super(key: key);

  @override
  _KtaCalculatorPageState createState() => _KtaCalculatorPageState();
}

class _KtaCalculatorPageState extends State<KtaCalculatorPage> {
  final GlobalKey<FormBuilderState> globalFormKey =
      GlobalKey<FormBuilderState>();
  final TextEditingController hargaRumahController = TextEditingController();
  final TextEditingController tenorController = TextEditingController();
  final TextEditingController sukuBungaController = TextEditingController();

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      debugPrint('here');
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
              child: const Text('Harga Rumah'),
            ),
            verticalSpacer1,
            CustomTextField(
              name: 'harga rumah',
              controller: hargaRumahController,
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
              nextRoute: () {
                final form = globalFormKey.currentState;
                form!.reset();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => const KtaResultPage(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
