import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPageWithStateful());
}

// 第一个类，对外
class MainPageWithStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print('createState阶段，一次');
    return _MainPageWithStatefulState();
  }
}

// 第二个类，对内，私有的

class _MainPageWithStatefulState extends State<MainPageWithStateful> {
  @override
  void initState() {
    print('initState阶段，一次');
    super.initState();
  }  

  @override
  void didChangeDependencies() {
    print('initChange阶段，可能多次');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('build阶段');
    return MaterialApp(
      title: '有状态组件',
      home: Scaffold(
        appBar: AppBar(
          title: Text('head'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Text('center'),
        ),
        bottomNavigationBar: Container(
          alignment: Alignment.center,
          height: 80,
          child: Text('bottom'),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant MainPageWithStateful oldWidget) {
    print('更新阶段');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('销毁阶段，暂时移除state时');
    super.deactivate();
  }

  @override
  void dispose() {
    print('销毁阶段，永久移除state时');
    super.dispose();
  }
}