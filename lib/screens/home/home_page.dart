import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_raymond/constant.dart';
import 'package:skripsi_raymond/models/banner.dart';
import 'package:skripsi_raymond/providers/banner_provider.dart';
import 'package:skripsi_raymond/providers/berita_provider.dart';
import 'package:skripsi_raymond/screens/home/components/news.dart';
import 'package:skripsi_raymond/utils/preference.dart';
import 'package:skripsi_raymond/widgets/bottom_navbar.dart';
import 'package:skripsi_raymond/widgets/custom_app_bar.dart';
import 'package:skripsi_raymond/widgets/loading.dart';

List<Widget> imageSliders(List<BannerModel> img) {
  return img.map((item) {
    return Container(
      margin: const EdgeInsets.all(2.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: Image.network(item.image ?? '', fit: BoxFit.cover, width: 1000.0),
      ),
    );
  }).toList();
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loadingBerita = true;
  bool loadingBanner = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<BeritaProvider>(context, listen: false).getBerita(Preferences.token).then((_) {
      setState(() => loadingBerita = false);
    }).catchError((_) {
      setState(() => loadingBerita = false);
    });
    Provider.of<BannerProvider>(context, listen: false).getBanner(Preferences.token).then((_) {
      setState(() => loadingBanner = false);
    }).catchError((_) {
      setState(() => loadingBanner = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final beritaData = Provider.of<BeritaProvider>(context).berita;
    final bannerData = Provider.of<BannerProvider>(context).banner;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        leading: const SizedBox(),
        title: const CustomAppBar('HOME'),
        elevation: 0,
        backgroundColor: primaryBackground,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: primaryBackground,
        padding: EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: MediaQuery.of(context).padding.top,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            loadingBanner
                ? const CustomLoading()
                : CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      autoPlayInterval: const Duration(seconds: 10),
                      autoPlayAnimationDuration: const Duration(seconds: 3),
                    ),
                    items: imageSliders(bannerData),
                  ),
            verticalSpacer7,
            const Text(
              'BERITA',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            loadingBerita
                ? const CustomLoading()
                : Expanded(
                    child: beritaData.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: ClipRRect(
                              child: Image.asset('assets/images/empty_news.jpg', fit: BoxFit.cover),
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                            ),
                          )
                        : SingleChildScrollView(
                            child: Column(children: [
                              for (int i = 0; i < beritaData.length; i++)
                                News(
                                  title: beritaData[i].title ?? '',
                                  image: beritaData[i].image ?? '',
                                  link: beritaData[i].link ?? '',
                                  last: i == beritaData.length - 1,
                                )
                            ]),
                          ),
                  ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavbar('home'),
    );
  }
}
