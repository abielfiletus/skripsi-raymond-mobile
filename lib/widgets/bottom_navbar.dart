import 'package:flutter/material.dart';
import 'package:skripsi_raymond/constant.dart';
import 'package:skripsi_raymond/screens/calculator/calculator_page.dart';
import 'package:skripsi_raymond/screens/home/home_page.dart';
import 'package:skripsi_raymond/screens/profile/profile_page.dart';
import 'package:skripsi_raymond/widgets/bottom_navbar_button.dart';

class BottomNavbar extends StatelessWidget {
  final String active;

  const BottomNavbar(this.active, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: fourthBackground,
        boxShadow: [
          BoxShadow(blurRadius: 5, color: Colors.black26, spreadRadius: 1)
        ],
      ),
      height: 65,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomNavbarButton(
            text: 'HOME',
            fontWeight: FontWeight.bold,
            active: active == 'home',
            onPress: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const HomePage(),
                ),
              );
            },
          ),
          BottomNavbarButton(
            text: 'CALCULATOR',
            fontWeight: FontWeight.bold,
            active: active == 'calculator',
            onPress: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const CalculatorPage(),
                ),
              );
            },
          ),
          BottomNavbarButton(
            text: 'CREDIT LOAN',
            fontWeight: FontWeight.bold,
            active: active == 'credit loan',
            onPress: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const CalculatorPage(),
                ),
              );
            },
          ),
          BottomNavbarButton(
            text: 'PROFILE',
            fontWeight: FontWeight.bold,
            active: active == 'profile',
            onPress: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const ProfilePage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
