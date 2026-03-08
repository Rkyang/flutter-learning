import 'package:flutter_learning/constants/index.dart';
import 'package:flutter_learning/utils/DioUtil.dart';
import 'package:flutter_learning/viewmodels/home.dart';

// 猜你喜欢
Future<GoodsDetailItems> getGuessLikeList(Map<String, dynamic> params) async {
  return GoodsDetailItems.formJSON(await dioUtil.get(HttpUrlConstants.guessList, params: params));
}