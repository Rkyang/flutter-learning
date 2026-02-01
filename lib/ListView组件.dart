import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ListView组件'), centerTitle: true),
        // separated构造，带分割
        body: ListView.separated(
          itemCount: 100,
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              height: 10,
              width: double.infinity,
              color: Colors.yellow,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 100,
              alignment: Alignment.center,
              width: double.infinity,
              color: Colors.blue,
              child: Text('这是第${index + 1}个', style: TextStyle(fontSize: 30, color: Colors.white),),
            );
          },
        ),

        // build构造，懒加载
        // body: ListView.builder(
        //   itemCount: 100,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Container(
        //       margin: EdgeInsets.only(top: 10),
        //       height: 100,
        //       alignment: Alignment.center,
        //       width: double.infinity,
        //       color: Colors.blue,
        //       child: Text('这是第${index + 1}个', style: TextStyle(fontSize: 30, color: Colors.white),),
        //     );
        //   },
        // ),

        // 默认构造，全量加载
        // body: ListView(
        //   children: List.generate(100, (index) {
        //     return Container(
        //       margin: EdgeInsets.only(top: 10),
        //       height: 100,
        //       alignment: Alignment.center,
        //       width: double.infinity,
        //       color: Colors.blue,
        //       child: Text('这是第${index + 1}个', style: TextStyle(fontSize: 30, color: Colors.white),),
        //     );
        //   }),
        // ),
      ),
    );
  }
}
