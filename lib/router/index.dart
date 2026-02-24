import 'package:flutter/material.dart';
import 'package:flutter_learning/pages/main/index.dart';
import 'package:flutter_learning/pages/login/index.dart';

/// 获取根级组件
Widget getRootWidget() {
  return MaterialApp(
    initialRoute: '/',
    routes: getRoutes(),
  );
}

/// 获取路由配置
Map<String, Widget Function(BuildContext)> getRoutes() {
  return {
    '/': (context) => MainPage(),
    '/login': (context) => LoginPage()
  };
}