import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/viewmodels/home.dart';

class Carousel extends StatefulWidget {
  final List<BannerItem> bannerItems;

  const Carousel({super.key, required this.bannerItems});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider()]);
  }

  /// 获取轮播图
  Widget _getSlider() {
    return CarouselSlider(
      items: List.generate(widget.bannerItems.length, (index) {
        return Image.network(
          widget.bannerItems[index].imgUrl,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        );
      }),
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
      ),
    );
  }
}
