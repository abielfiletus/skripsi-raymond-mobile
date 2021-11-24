import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:skripsi_raymond/constant.dart';
import 'package:skripsi_raymond/screens/home/components/news.dart';
import 'package:skripsi_raymond/widgets/bottom_navbar.dart';
import 'package:skripsi_raymond/widgets/custom_app_bar.dart';

const List<String> img = [
  'https://awsimages.detik.net.id/community/media/visual/2019/09/05/1ab05025-e002-4777-9940-36cc34c1747c_43.png?w=700&q=90',
  'https://cdn.theatlantic.com/thumbor/-EpdHDfBlNGz-nq6lKXMW-hj-kU=/153x0:1220x600/960x540/media/img/mt/2019/01/ariana_7-2/original.jpg'
];

List<Map<String, String>> news = [
  {
    'title': 'JUDUL BERITA PENGKREDITAN 1',
    'image':
        'https://awsimages.detik.net.id/community/media/visual/2019/09/05/1ab05025-e002-4777-9940-36cc34c1747c_43.png?w=700&q=90',
  },
  {
    'title': 'JUDUL BERITA PENGKREDITAN 2',
    'image':
        'https://awsimages.detik.net.id/community/media/visual/2019/09/05/1ab05025-e002-4777-9940-36cc34c1747c_43.png?w=700&q=90',
  },
  {
    'title': 'JUDUL BERITA PENGKREDITAN 3',
    'image':
        'https://awsimages.detik.net.id/community/media/visual/2019/09/05/1ab05025-e002-4777-9940-36cc34c1747c_43.png?w=700&q=90',
  },
  {
    'title': 'JUDUL BERITA PENGKREDITAN 4',
    'image':
        'https://awsimages.detik.net.id/community/media/visual/2019/09/05/1ab05025-e002-4777-9940-36cc34c1747c_43.png?w=700&q=90',
  },
  {
    'title': 'JUDUL BERITA PENGKREDITAN 5',
    'image':
        'https://awsimages.detik.net.id/community/media/visual/2019/09/05/1ab05025-e002-4777-9940-36cc34c1747c_43.png?w=700&q=90',
  },
];

List<Widget> imageSliders = img
    .map((item) => Container(
          margin: const EdgeInsets.all(2.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Image.network(item, fit: BoxFit.cover, width: 1000.0),
          ),
        ))
    .toList();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                autoPlayInterval: const Duration(seconds: 10),
                autoPlayAnimationDuration: const Duration(seconds: 3),
              ),
              items: imageSliders,
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  for (int i = 0; i < news.length; i++)
                    News(
                      title: news[i]['title'],
                      image: news[i]['image'],
                      last: i == news.length - 1,
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
