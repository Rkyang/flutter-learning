import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPageWithStateful());
}

// 第一个类，对外
class MainPageWithStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageWithStatefulState();
  }
}

// 第二个类，对内，私有的

class _MainPageWithStatefulState extends State<MainPageWithStateful> {
  @override
  Widget build(BuildContext context) {
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
}