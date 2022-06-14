import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Beranda extends StatelessWidget {
  Beranda({Key? key}) : super(key: key);

  final List<String> urlImageAds = [
    "assets/image 1.png",
    "assets/image 2.png",
    "assets/image 3.png",
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: 3,
        options: CarouselOptions(
            height: 200,
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayInterval: const Duration(seconds: 4)),
        itemBuilder: (context, index, realindex) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(urlImageAds[index]), fit: BoxFit.cover),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 5), blurRadius: 5, color: Colors.grey)
                  ]),
            ),
          );
        });
  }
}
