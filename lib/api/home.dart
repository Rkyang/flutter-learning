import 'package:flutter_learning/constants/index.dart';
import 'package:flutter_learning/utils/DioUtil.dart';
import 'package:flutter_learning/viewmodels/home.dart';
/// 获取轮播图
Future<List<BannerItem>> getBannerListApi() async {
  List<dynamic> resp = await dioUtil.get(HttpUrlConstants.bannerList) as List<dynamic>; 
  return resp.map((item) {
    return BannerItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

/// 获取分类
Future<List<CategoryItem>> getCategoryListApi() async {
  List<dynamic> resp = await dioUtil.get(HttpUrlConstants.categoryList) as List<dynamic>;
  return resp.map((item) {
    return CategoryItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

// 获取特惠推荐
Future<SpecialOfferResult> getSpecialOfferApi() async {
  return SpecialOfferResult.formJSON(await dioUtil.get(HttpUrlConstants.productList));
}

// 爆款推荐
Future<SpecialOfferResult> getHotProductApi() async {
  return SpecialOfferResult.formJSON(await dioUtil.get(HttpUrlConstants.hotList));
}

// 一站买全
Future<SpecialOfferResult> getAllInOneApi() async {
  return SpecialOfferResult.formJSON(await dioUtil.get(HttpUrlConstants.allInOne));
}

// 推荐列表
Future<List<GoodsDetailItem>> getRecommendListApi(Map<String, dynamic> params) async {
  List<dynamic> resp = await dioUtil.get(HttpUrlConstants.recommendList, params: params) as List<dynamic>; 
  return resp.map((item) {
    return GoodsDetailItem.formJSON(item as Map<String, dynamic>);
  }).toList();
}