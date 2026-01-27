void main(List<String> args) {
  // 空安全机制

  // 可空类型：?
  String? name = null;
  print(name);

  // 安全访问：?.（对象为null时跳过操作，返回null）
  var startsWith = name?.startsWith('a');
  print(startsWith);

  // 非空断言：!. 开发者保证非空
  // name!.startsWith('a');

  // 空合并：xx ?? xx（左侧为null时返回右侧值）
  String finalName = null ?? 'default';
  print(finalName);
}