import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPageStateless());
}

class MainPageStateless extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '无状态组件',
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