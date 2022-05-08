import 'package:flutter/material.dart';
import 'package:skripsi_raymond/constant.dart';
import 'package:skripsi_raymond/screens/credit-loan/kpr/kpr_credit_loan_page.dart';
import 'package:skripsi_raymond/screens/credit-loan/kta/kta_credit_loan_page.dart';
import 'package:skripsi_raymond/widgets/bottom_navbar.dart';
import 'package:skripsi_raymond/widgets/custom_app_bar.dart';

class CreditLoanPage extends StatefulWidget {
  const CreditLoanPage({Key? key}) : super(key: key);

  @override
  _CreditLoanPageState createState() => _CreditLoanPageState();
}

class _CreditLoanPageState extends State<CreditLoanPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: const CustomAppBar('CREDIT LOAN'),
          elevation: 0,
          backgroundColor: primaryBackground,
          bottom: PreferredSize(
            preferredSize: const Size(0, 50),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50)),
              child: TabBar(
                unselectedLabelColor: fourthBackground,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(borderRadius: BorderRadius.circular(50), color: fourthBackground),
                tabs: [
                  Tab(
                    child: Container(
                      child: const Align(alignment: Alignment.center, child: Text("KPR")),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: const Align(alignment: Alignment.center, child: Text("KTA")),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          color: primaryBackground,
          padding: const EdgeInsets.all(10),
          child: const TabBarView(
            children: [
              KprCreditLoanPage(),
              KtaCreditLoanPage(),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavbar('credit loan'),
      ),
    );
  }
}
