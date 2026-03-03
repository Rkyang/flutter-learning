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