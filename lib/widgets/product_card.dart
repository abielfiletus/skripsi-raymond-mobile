import 'package:flutter/material.dart';
import 'package:skripsi_raymond/constant.dart';
import 'package:skripsi_raymond/widgets/custom_card.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String bankName;
  final String type;
  final String bunga;
  final String unit;
  final String tenor;
  final Function()? onTap;

  const ProductCard({
    required this.image,
    required this.bankName,
    required this.tenor,
    required this.type,
    required this.bunga,
    required this.unit,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      marginBottom: 10,
      child: Row(
        children: [
          Image.network(
            image,
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
                  '$bankName | $type',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                verticalSpacer1,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Suku Bunga: $bunga % / $unit',
                      style: const TextStyle(fontSize: 11),
                    ),
                    Text(
                      'Tenor: $tenor $unit',
                      style: const TextStyle(fontSize: 11),
                    ),
                  ],
                ),
                verticalSpacer1,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 25,
                      child: TextButton(
                        onPressed: onTap ?? () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            secondaryBackground,
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(5),
                          ),
                        ),
                        child: const Text(
                          'AJUKAN SEKARANG',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
