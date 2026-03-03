import 'package:flutter/material.dart';
import 'package:flutter_learning/api/home.dart';
import 'package:flutter_learning/components/home/category.dart';
import 'package:flutter_learning/components/home/carousel.dart';
import 'package:flutter_learning/components/home/hot.dart';
import 'package:flutter_learning/components/home/product.dart';
import 'package:flutter_learning/components/home/recommend.dart';
import 'package:flutter_learning/viewmodels/home.dart';

/// 首页
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // 定义轮播图使用的数据
  List<BannerItem> _bannerDataList = [];
  // 获取分类数据
  List<CategoryItem> _categoryDataList = [];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getSlivers());
  }

  @override
  void initState() {
    super.initState();
    _getInitData();
  }

  void _getInitData() async {
    _bannerDataList = await getBannerListApi();
    _categoryDataList = await getCategoryListApi();
    setState(() {});
  }

  /// 获取滚动容器的内容
  List<Widget> _getSlivers() {
    return [
      // 轮播图
      SliverToBoxAdapter(child: Carousel(bannerItems: _bannerDataList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 横向滚动分类
      SliverToBoxAdapter(child: Category(categoryList: _categoryDataList,)),
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
            SizedBox(width: 10),
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
