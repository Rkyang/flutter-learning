

void main(List<String> args) {
  Future f = Future(() {
    return '123456';
    // throw Exception('error');
  });

  // 成功：没有异常时
  f.then((v) {
    print(v);
  });

  // 失败：有异常时
  f.catchError((e) {
    print(e);
  });

  // 链式调用
  Future(() {
    return 'task1';
  }).then((v) {
    // print('$v-task2');
    return Future(() => '$v-task2');
  }).then((v) {
    print('$v-task3');
    // throw Exception('error');
    // return Future(() => '$v-task3');
  }).catchError((e) {
    print(e);
  });

  test();
}

/* 
async/await
  必须配套出现
  await后的代码，必须等awai代码成功执行后才会执行
  使用try捕获异常
 */
void test() async {
  try {
    String result = await Future(() {
      return '12345';
    });

    // await后的代码，必须等awai代码成功执行后才会执行

    print(result);

    print('over');
  } catch (e) {
    print('e');
  }
}
