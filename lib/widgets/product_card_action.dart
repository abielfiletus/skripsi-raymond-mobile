import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:skripsi_raymond/constant.dart';
import 'package:skripsi_raymond/widgets/custom_card.dart';
import 'package:skripsi_raymond/widgets/custom_text_field.dart';

class ProductCardAction extends StatefulWidget {
  final String image;
  final String bankName;
  final String type;
  final String bunga;
  final String unit;
  final String? tenor;
  final Function() onDetailTap;
  final Function() onSubmitTap;
  final bool? withTextField;

  const ProductCardAction({
    required this.image,
    required this.bankName,
    required this.type,
    required this.bunga,
    required this.unit,
    required this.onDetailTap,
    required this.onSubmitTap,
    this.tenor,
    this.withTextField,
    Key? key,
  }) : super(key: key);

  @override
  _ProductCardActionState createState() => _ProductCardActionState();
}

class _ProductCardActionState extends State<ProductCardAction> {
  final TextEditingController nominalController = TextEditingController();
  final TextEditingController tenorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      marginBottom: 10,
      child: Row(
        children: [
          Image.network(
            widget.image,
            width: 70,
            height: 70,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.bankName} | ${widget.type}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                verticalSpacer1,
                if (widget.withTextField != null)
                  CustomTextField(
                    name: 'nominal',
                    controller: nominalController,
                    hintText: 'Masukan Nominal',
                    keyboardType: TextInputType.number,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black38, width: 1.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black38, width: 1.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: const TextStyle(fontSize: 12),
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                if (widget.withTextField != null) verticalSpacer1,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Suku Bunga: ${widget.bunga} % / ${widget.unit}',
                      style: const TextStyle(fontSize: 11),
                    ),
                    widget.withTextField != null
                        ? SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                const Text('Tenor : ', style: TextStyle(fontSize: 11)),
                                SizedBox(
                                  width: 30,
                                  child: CustomTextField(
                                    name: 'tenor',
                                    controller: tenorController,
                                    hintText: 'xx',
                                    keyboardType: TextInputType.number,
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.black38, width: 1.0),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.black38, width: 1.0),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    textStyle: const TextStyle(fontSize: 12),
                                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                    dense: true,
                                  ),
                                ),
                                Text(' ${widget.unit}', style: const TextStyle(fontSize: 11)),
                              ],
                            ),
                          )
                        : Text(
                            'Tenor: ${widget.tenor} ${widget.unit}',
                            style: const TextStyle(fontSize: 11),
                          ),
                  ],
                ),
                verticalSpacer1,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 140,
                      height: 25,
                      child: TextButton(
                        onPressed: widget.onSubmitTap,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(secondaryBackground),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          ),
                          padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
                        ),
                        child: const Text(
                          'AJUKAN SEKARANG',
                          style: TextStyle(color: primaryColor, fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Lihat Detail >',
                        style: const TextStyle(color: linkColor, fontSize: 14, fontWeight: FontWeight.w500),
                        recognizer: TapGestureRecognizer()..onTap = widget.onDetailTap,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
