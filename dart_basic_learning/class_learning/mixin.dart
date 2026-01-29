void main(List<String> args) {
  Student s = Student(name: 'zs');
  s.study(s.name);

  Teacher t = Teacher(name: 'ls');
  s.study(t.name);
}

// 类 混入
mixin Base {
  void study(String? name) {
    print('$name learning……');
  }
}

class Student with Base{
  String? name;

  Student({this.name});
}

class Teacher with Base{
  String? name;

  Teacher({this.name});
}