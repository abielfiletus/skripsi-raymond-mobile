import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class News extends StatelessWidget {
  final String? title;
  final String? image;
  final bool last;

  const News({
    required this.last,
    this.title,
    this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      decoration: BoxDecoration(
        border: Border(
            bottom: last
                ? const BorderSide(width: 0)
                : const BorderSide(color: Colors.white, width: 3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? '-',
            softWrap: true,
            maxLines: 3,
            style: const TextStyle(color: Colors.white),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image ?? 'assets/images/logo.png',
              fit: BoxFit.cover,
              width: 60,
              height: 60,
            ),
          ),
        ],
      ),
    );
  }
}
