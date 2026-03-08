import 'package:flutter_learning/viewmodels/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  // 需要共享的属性
  var user = UserInfo.fromJSON({}).obs;
  // 更新
  void updateUserInfo(UserInfo newUserInfo) {
    user.value = newUserInfo;
  }
}