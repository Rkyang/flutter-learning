import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Column组件'),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween, // 主轴：两头对齐
            // mainAxisAlignment: MainAxisAlignment.spaceAround, // 主轴：环绕对齐
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 主轴：均分模式
            // mainAxisAlignment: MainAxisAlignment.start, // 主轴：从头排列
            // mainAxisAlignment: MainAxisAlignment.end, // 主轴：从尾部排列
            mainAxisAlignment: MainAxisAlignment.center, // 主轴：居中
            // crossAxisAlignment: CrossAxisAlignment.start, // 交叉轴：从头
            // crossAxisAlignment: CrossAxisAlignment.end, // 交叉轴：从尾部
            crossAxisAlignment: CrossAxisAlignment.center, // 交叉轴：居中
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.blue,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.blue,
                margin: EdgeInsets.only(top: 10),
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.blue,
                margin: EdgeInsets.only(top: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}