/// 轮播图数据对象
class BannerItem {
  String id;
  String imgUrl;
  BannerItem({required this.id, required this.imgUrl});

  /// 工厂函数
  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(id: json['id'] ?? '', imgUrl: json['imgUrl'] ?? '');
  }
}
