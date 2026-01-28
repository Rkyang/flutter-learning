void main(List<String> args) {
  print(add(1, 2));
  printInt(10);
  printString('hhhhh');
  print(combine('a'));
  print(say('zs', age: 18, phone: '654321'));
  onNoNameFunc(noNameFunc);
  print(add2(2, 3));
}

// 函数
int add(int a, int b) {
  return a + b;
}

// 无返回值函数
void printInt(int a) {
  print(a);
}

// 动态返回值函数
printString(String a) {
  print(a);
}

// 函数：可选位置参数
String combine(String a, [String? b, String c = 'c']) {
  return a + (b ?? 'b') + c;
}

// 函数：可选命名参数
String say(String name, {int? age, String? gender, String phone = '12345'}) {
  return 'info: name=$name, age=${age}, gender=${gender}, phone=${phone}';
}

// 匿名函数，可做变量传递
Function noNameFunc = () {
  print('noNameFunc');
};

void onNoNameFunc(Function callback) {
  callback();
}

// 箭头函数：return可省略
int add2(int a, int b) => a + b;