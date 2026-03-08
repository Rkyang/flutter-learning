/// 全局常量
class GlobalConstants {
  /// 请求基础地址
  static const String baseUrl = 'https://meikou-api.itheima.net';
  /// 请求超时时间
  static const int timeOut = 10;
  /// 请求响应成功状态码
  static const String successCode = '1';
}

/// 请求路径常量
class HttpUrlConstants {
  static const String bannerList = '/home/banner'; // 轮播图
  static const String categoryList = '/home/category/head'; // 分类
  static const String productList = '/hot/preference'; // 特惠推荐
  static const String hotList = '/hot/inVogue'; // 爆款推荐
  static const String allInOne = '/hot/oneStop'; // 一站买全
  static const String recommendList = '/home/recommend'; // 推荐列表
  static const String guessList = '/home/goods/guessLike'; // 猜你喜欢
  static const String login = '/login'; // 登录
}