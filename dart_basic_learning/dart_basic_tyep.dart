void main(List<String> args) {
  // 基本类型
  var v1 = '这是变量';
  print(v1);

  const c1 = '这是常量';
  print(c1);

  final f1 = '这也是常量';
  print(f1);

  String s1 = "字符串";
  print(s1);

  int i1 = 50;
  print(i1);

  num n1 = 2.54;
  print(n1);

  double d1 = 3.1415926;
  print(d1);

  bool b1 = true;
  print(b1);

  // 列表类型
  List l1 = ['a', 'b', 'c', 'd'];
  print(l1);
  l1.add('e');
  print(l1);
  l1.addAll(['f', 'g', 'a']);
  print(l1);
  l1.remove('a');//删除符合的第一个
  print(l1);
  l1.removeLast();
  print(l1);
  l1.removeRange(1, 4);//索引含左不含右，左闭右开原则
  print(l1);

  l1 = ['a', 'b', 'c', 'd', 'a1', 'F'];
  l1.forEach((item) {
    print(item);
  });
  bool isStartWith = l1.every((item) {//every：列表中数据是否全部满足条件
    return item.toString().startsWith('a');
  });
  print(isStartWith);
  List where = l1.where((item) {//where：筛选满足条件的数据
    return item.toString().startsWith('a');
  }).toList();
  print(where);
  print(l1.length);
  print(l1.last);
  print(l1.first);
  print(l1.isEmpty);

  // 字典类型
  Map m1 = {
    'breakfast': '早',
    'lunch': '午',
    'dinner': '晚'
  };
  print(m1);
  print(m1['lunch']);
  m1['lunch'] = '中午饭';
  print(m1['lunch']);
  m1.forEach((k, v) {
    print('$k,$v');
  });
  m1.addAll({
    'a': '1',
    'b': '2'
  });
  print(m1);
  print(m1.containsKey('c'));
  m1.remove('a');
  print(m1);
  m1.clear();
  print(m1);

  // 动态类型：绕过编译检查，容易运行时异常
  dynamic dy1 = '';
  dy1 = 123;
  dy1 = [];
  dy1 = {};
  dy1 = false;
  print(dy1);
}