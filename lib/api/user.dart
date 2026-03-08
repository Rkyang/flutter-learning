import 'package:flutter_learning/constants/index.dart';
import 'package:flutter_learning/utils/DioUtil.dart';
import 'package:flutter_learning/viewmodels/user.dart';

Future<UserInfo> login(Map<String, dynamic> data) async {
  return UserInfo.fromJSON(await dioUtil.post(HttpUrlConstants.login, data: data) as Map<String, dynamic>);
}