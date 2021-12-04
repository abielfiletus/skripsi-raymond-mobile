import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class News extends StatelessWidget {
  final String title;
  final String image;
  final String link;
  final bool last;

  const News({
    required this.last,
    required this.title,
    required this.image,
    required this.link,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.black38,
        highlightColor: Colors.white70,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          decoration: BoxDecoration(
            border: Border(
              bottom: last ? const BorderSide(width: 0) : const BorderSide(color: Colors.white, width: 3),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, softWrap: true, maxLines: 3, style: const TextStyle(color: Colors.white)),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(image, fit: BoxFit.cover, width: 60, height: 60),
              ),
            ],
          ),
        ),
        onTap: _launchURL,
      ),
    );
  }

  void _launchURL() async {
    print('clicked');
    if (!await launch(link)) throw 'Could not launch $link';
  }
}
