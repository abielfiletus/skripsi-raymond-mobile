import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_raymond/providers/auth_provider.dart';
import 'package:skripsi_raymond/providers/banner_provider.dart';
import 'package:skripsi_raymond/providers/berita_provider.dart';
import 'package:skripsi_raymond/providers/kpr_provider.dart';
import 'package:skripsi_raymond/providers/kta_provider.dart';
import 'package:skripsi_raymond/screens/home/home_page.dart';
import 'package:skripsi_raymond/screens/login/login_page.dart';
import 'package:skripsi_raymond/utils/preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  final mainPage = Preferences.isLogin ? const HomePage() : const LoginPage();

  runApp(MyApp(mainPage));
}

class MyApp extends StatelessWidget {
  final Widget mainPage;
  const MyApp(this.mainPage, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => BeritaProvider()),
        ChangeNotifierProvider(create: (_) => BannerProvider()),
        ChangeNotifierProvider(create: (_) => KtaResultProvider()),
        ChangeNotifierProvider(create: (_) => KprResultProvider()),
      ],
      child: MaterialApp(
        title: 'KPR KTA Credit Loan',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Arial'),
        home: mainPage,
      ),
    );
  }
}
