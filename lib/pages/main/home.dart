import 'package:flutter/material.dart';
import 'package:flutter_learning/api/home.dart';
import 'package:flutter_learning/components/home/category.dart';
import 'package:flutter_learning/components/home/carousel.dart';
import 'package:flutter_learning/components/home/hot.dart';
import 'package:flutter_learning/components/home/product.dart';
import 'package:flutter_learning/components/home/recommend.dart';
import 'package:flutter_learning/utils/ToastUtils.dart';
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
  // 分类数据
  List<CategoryItem> _categoryDataList = [];
  // 特惠推荐数据
  SpecialOfferResult _specialOfferDataList = SpecialOfferResult(
    id: '',
    title: '',
    subTypes: [],
  );
  // 爆款推荐数据
  SpecialOfferResult _hotDataList = SpecialOfferResult(
    id: '',
    title: '',
    subTypes: [],
  );
  // 一站买全推荐数据
  SpecialOfferResult _allInOneDataList = SpecialOfferResult(
    id: '',
    title: '',
    subTypes: [],
  );
  // 推荐列表数据
  List<GoodsDetailItem> _recommendList = [];
  // 屏幕滚动controller
  final ScrollController _scrollController = ScrollController();
  // 无限滚动当前页码
  int _currentPage = 1;
  // 无限滚动是否存在执行中请求
  bool _hasExecuteReq = false;
  // 无限滚动是否还有数据
  bool _hasMoreData = true;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: _getSlivers(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getInitData();
  }

  void _getInitData() async {
    _bannerDataList = await getBannerListApi();
    _categoryDataList = await getCategoryListApi();
    _specialOfferDataList = await getSpecialOfferApi();
    _hotDataList = await getHotProductApi();
    _allInOneDataList = await getAllInOneApi();
    _getRecommendList();
    _screenMonitor();
    setState(() {});
  }

  /// 获取滚动容器的内容
  List<Widget> _getSlivers() {
    return [
      // 轮播图
      SliverToBoxAdapter(child: Carousel(bannerItems: _bannerDataList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 横向滚动分类
      SliverToBoxAdapter(child: Category(categoryList: _categoryDataList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 推荐区域
      SliverToBoxAdapter(
        child: Recommend(specialOfferResult: _specialOfferDataList),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 爆款区域
      SliverToBoxAdapter(
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: Hot(
                mainTitle: '爆款推荐',
                subTitle: '最受欢迎',
                backgroundColor: const Color.fromARGB(255, 204, 228, 240),
                hotList: _hotDataList,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Hot(
                mainTitle: '一站买全',
                subTitle: '精心优选',
                backgroundColor: const Color.fromARGB(255, 244, 248, 218),
                hotList: _allInOneDataList,
              ),
            ),
          ],
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 商品滚动区域
      Product(goodsItem: _recommendList),
    ];
  }

  // 获取推荐列表数据
  void _getRecommendList() async {
    if (_hasExecuteReq || !_hasMoreData) {
      // 存在执行中请求或者没有更多数据了
      return;
    }
    _hasExecuteReq = true;
    int currentLimit = _currentPage * 10;
    _recommendList = await getRecommendListApi({'limit': currentLimit});
    _hasExecuteReq = false;
    setState(() {});
    if (_recommendList.length < currentLimit) {
      _hasMoreData = false;
      return;
    }
    _currentPage++;
  }

  // 监听屏幕滚动
  void _screenMonitor() {
    _scrollController.addListener(() {
      // _scrollController.position.maxScrollExtent: 滚动到底部的最大距离
      // _scrollController.position.pixels: 滚动的距离
      if (_scrollController.position.pixels >
          (_scrollController.position.maxScrollExtent - 100)) {
        _getRecommendList();
      }
    });
  }

  // 下拉刷新
  Future<void> _onRefresh() async {
    _currentPage = 1;
    _hasExecuteReq = false;
    _hasMoreData = true;
    _getInitData();
    // 提示消息
    ToastUtils.showToast(context, '刷新成功');
  }
}
