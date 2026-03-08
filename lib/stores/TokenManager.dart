import 'package:flutter_learning/constants/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  // 获取sp实例
  Future<SharedPreferences> _getInstance() {
    return SharedPreferences.getInstance();
  }

  // token
  String _token = '';

  Future<void> init() async {
    final prefs = await _getInstance();
    _token = prefs.getString(GlobalConstants.tokenKey) ?? '';
  }

  Future<void> setToken(String val) async {
    final prefs = await _getInstance();
    // token持久化，写入到磁盘
    prefs.setString(GlobalConstants.tokenKey, val);
    _token = val;
  }

  String getToken() {
    return _token;
  }

  Future<void> removeToken() async {
    final prefs = await _getInstance();
    prefs.remove(GlobalConstants.tokenKey);
    _token = '';
  }
}

final tokenManager = TokenManager();
