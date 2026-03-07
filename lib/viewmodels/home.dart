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

/// 分类数据对象
class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;
  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
  });

  /// 工厂函数
  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      picture: json['picture'] ?? '',
      children: json['children'] == null
          ? null
          : (json['children'] as List)
                .map((e) => CategoryItem.fromJson(e))
                .toList(),
    );
  }
}


// 特惠推荐 - 商品项
class GoodsItem {
  String id;
  String name;
  String? desc;
  String price;
  String picture;
  int orderNum;
  GoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });
  factory GoodsItem.formJSON(Map<String, dynamic> json) {
    return GoodsItem(
      id: json["id"]?.toString() ?? "",
      name: json["name"]?.toString() ?? "",
      desc: json["desc"]?.toString(),
      price: json["price"]?.toString() ?? "",
      picture: json["picture"]?.toString() ?? "",
      orderNum: int.tryParse(json["orderNum"]?.toString() ?? "0") ?? 0,
    );
  }
}

// 特惠推荐 - 商品分页信息
class GoodsItems {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<GoodsItem> items;
  GoodsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });
  factory GoodsItems.formJSON(Map<String, dynamic> json) {
    return GoodsItems(
      counts: int.tryParse(json["counts"]?.toString() ?? "0") ?? 0,
      pageSize: int.tryParse(json["pageSize"]?.toString() ?? "0") ?? 0,
      pages: int.tryParse(json["pages"]?.toString() ?? "0") ?? 0,
      page: int.tryParse(json["page"]?.toString() ?? "0") ?? 0,
      items: (json["items"] as List? ?? [])
          .map((item) => GoodsItem.formJSON(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

// 特惠推荐 - 子类型
class SubType {
  String id;
  String title;
  GoodsItems goodsItems;
  SubType({required this.id, required this.title, required this.goodsItems});
  factory SubType.formJSON(Map<String, dynamic> json) {
    return SubType(
      id: json["id"]?.toString() ?? "",
      title: json["title"]?.toString() ?? "",
      goodsItems: GoodsItems.formJSON(
        json["goodsItems"] as Map<String, dynamic>,
      ),
    );
  }
}

// 特惠推荐 - 结果
class SpecialOfferResult {
  String id;
  String title;
  List<SubType> subTypes;
  SpecialOfferResult({
    required this.id,
    required this.title,
    required this.subTypes,
  });
  factory SpecialOfferResult.formJSON(Map<String, dynamic> json) {
    return SpecialOfferResult(
      id: json["id"]?.toString() ?? "",
      title: json["title"]?.toString() ?? "",
      subTypes: (json["subTypes"] as List? ?? [])
          .map((item) => SubType.formJSON(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

// 推荐列表
class GoodsDetailItem extends GoodsItem {
  int payCount = 0;
  // 商品详情项
  GoodsDetailItem({
    required super.id,
    required super.name,
    required super.price,
    required super.picture,
    required super.orderNum,
    required this.payCount,
  }) : super(desc: "");
  // 转化方法
  factory GoodsDetailItem.formJSON(Map<String, dynamic> json) {
    return GoodsDetailItem(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      price: json['price']?.toString() ?? '',
      picture: json['picture']?.toString() ?? '',
      orderNum: int.tryParse(json['orderNum']?.toString() ?? '0') ?? 0,
      payCount: int.tryParse(json['payCount']?.toString() ?? '0') ?? 0
    );
  }
}