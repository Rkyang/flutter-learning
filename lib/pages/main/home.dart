import 'package:flutter/material.dart';
import 'package:flutter_learning/components/home/category.dart';
import 'package:flutter_learning/components/home/carousel.dart';
import 'package:flutter_learning/components/home/hot.dart';
import 'package:flutter_learning/components/home/product.dart';
import 'package:flutter_learning/components/home/recommend.dart';

/// 首页
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getSlivers());
  }

  /// 获取滚动容器的内容
  List<Widget> _getSlivers() {
    return [
      // 轮播图
      SliverToBoxAdapter(child: Carousel()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 横向滚动分类
      SliverToBoxAdapter(child: Category()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 推荐区域
      SliverToBoxAdapter(child: Recommend()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 爆款区域
      SliverToBoxAdapter(
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(child: Hot()),
            SizedBox(width: 10,),
            Expanded(child: Hot()),
          ],
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 商品滚动区域
      Product(),
    ];
  }
}
