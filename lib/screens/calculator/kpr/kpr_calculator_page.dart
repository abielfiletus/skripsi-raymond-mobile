import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_raymond/constant.dart';
import 'package:skripsi_raymond/providers/kpr_provider.dart';
import 'package:skripsi_raymond/screens/calculator/kpr/kpr_result_page.dart';
import 'package:skripsi_raymond/utils/preference.dart';
import 'package:skripsi_raymond/widgets/custom_button.dart';
import 'package:skripsi_raymond/widgets/custom_text_field.dart';

class KprCalculatorPage extends StatefulWidget {
  const KprCalculatorPage({Key? key}) : super(key: key);

  @override
  _KprCalculatorPageState createState() => _KprCalculatorPageState();
}

class _KprCalculatorPageState extends State<KprCalculatorPage> {
  final GlobalKey<FormBuilderState> globalFormKey = GlobalKey<FormBuilderState>();
  final TextEditingController hargaRumahController = TextEditingController();
  final TextEditingController tenorController = TextEditingController();
  final TextEditingController sukuBungaController = TextEditingController();
  final TextEditingController dpController = TextEditingController();

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
              suffix: 'Tahun',
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
              textInputAction: TextInputAction.next,
              hintText: 'Masukkan Angka',
              suffix: '% / Tahun',
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
              child: const Text('DP'),
            ),
            verticalSpacer1,
            CustomTextField(
              name: 'dp',
              controller: dpController,
              keyboardType: TextInputType.number,
              hintText: 'Masukkan Angka',
              suffix: '%',
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
                  final data = await Provider.of<KprResultProvider>(context, listen: false).getKprResult(
                    token: Preferences.token,
                    tenor: double.parse(tenorController.text),
                    hargaRumah: double.parse(hargaRumahController.text),
                    interest: double.parse(sukuBungaController.text),
                    dp: double.parse(dpController.text),
                  );
                  final form = globalFormKey.currentState;
                  form!.reset();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => KprResultPage(data),
                    ),
                  );
                } catch (err) {
                  print(err);
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
