void main(List<String> args) {
  Child c = Child(name: 'zs');
  c.study();
}

class Parent {
  String? name = '';

  Parent({this.name});

  void study() {
    print('parent-$name在学习');
  }
}

// 继承
class Child extends Parent{
  // 不会自动继承父类构造，使用:super(属性)传递给父类
  Child({String? name}): super(name: name);

  // 子类重写父类方法
  @override
  void study() {
    // super.study();
    print('child-$name在学习');
  }
}