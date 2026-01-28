void main(List<String> args) {
  // Person p = Person();
  // p.name = 'zs';
  // p.study();

  Person p = Person(name: 'zs', age: 12, gender: 'man');
  p.study();

  Person p1 = Person.renameCon(name: 'ls');
  p1.study();

  Person p2 = Person.renameCon2(name: 'ww');
  p2.study();
}

class Person {
  // 类属性（公有属性）
  String? name = '';
  int? age = 0;
  String? gender = '';
  // 类属性（私有属性，下划线开头）
  String _version = '';

  // 默认同名构造函数
  // Person({String? name, int? age, String? gender}) {
  //   this.name = name;
  //   this.age = age;
  //   this.gender = gender;
  // }

  // 命名构造函数
  Person.renameCon({String? name}) {
    this.name = name;
  }

  // 构造函数语法糖
  Person({this.name, this.age, this.gender});
  Person.renameCon2({this.name, this.age, this.gender});

  // 类方法（公有方法）
  void study() {
    print('$name在学习');
    _study2();
  }

  // 类方法（私有方法，下划线开头）
  void _study2() {
    print('version=$_version');
  }
}