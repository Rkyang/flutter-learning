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
  // 搜索框输入控制器
  final TextEditingController _searchWidgetCtrl = TextEditingController();
  // 轮播图导航控制器
  final CarouselSliderController _sliderController = CarouselSliderController();
  // 轮播图当前索引
  int _currentSilderIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_getSlider(), _getSearch(), _getCarouselSliderNavigator()],
    );
  }

  /// 获取轮播图
  Widget _getSlider() {
    return CarouselSlider(
      carouselController: _sliderController,
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
        onPageChanged: (index, reason) {
          setState(() {
            _currentSilderIndex = index;
          });
        },
      ),
    );
  }

  /// 获取轮播图上部搜索框
  Widget _getSearch() {
    double maxWidth = MediaQuery.of(context).size.width;

    return Positioned(
      width: maxWidth * 0.9,
      height: 40,
      top: 20,
      left: (maxWidth - (maxWidth * 0.9)) / 2, // （父宽-子宽）/2：确保居中
      child: TextField(
        controller: _searchWidgetCtrl,
        maxLines: 1,
        decoration: InputDecoration(
          isDense: true,
          hintText: '搜索',
          filled: true,
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          fillColor: Color.fromRGBO(0, 0, 0, 0.3),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
        ),
      ),
    );
  }

  /// 获取轮播图下部导航
  Widget _getCarouselSliderNavigator() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: List.generate(widget.bannerItems.length, (index) {
            return GestureDetector(
              onTap: () {
                _sliderController.animateToPage(
                  index,
                  curve: Curves.easeIn,
                  duration: Duration(milliseconds: 200),
                );
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: _currentSilderIndex == index ? 30 : 15,
                height: 5,
                decoration: BoxDecoration(
                  color: _currentSilderIndex == index ? Colors.white : Color.fromRGBO(0, 0, 0, 0.3),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
