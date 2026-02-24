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
        appBar: AppBar(title: Text('GridView组件'), centerTitle: true),
        // build构造：懒加载
        body: GridView.builder(
          // 布局委托：指定最大宽高度
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.5, // 宽高比：内容形状
          ),
          // 布局委托：固定列行数
          // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          padding: EdgeInsets.all(10),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              width: double.infinity,
              color: Colors.blue,
              child: Text(
                '这是第${index + 1}个',
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            );
          },
        ),

        // // extent构造：指定最大宽度/高度
        // body: GridView.extent(
        //   // scrollDirection: Axis.horizontal, // 滚动方向：水平滚动
        //   maxCrossAxisExtent: 100, // 最大宽度/高度
        //   padding: EdgeInsets.all(10),
        //   mainAxisSpacing: 10,
        //   crossAxisSpacing: 10,
        //   children: List.generate(100, (index) {
        //     return Container(
        //       alignment: Alignment.center,
        //       width: double.infinity,
        //       color: Colors.blue,
        //       child: Text('这是第${index + 1}个', style: TextStyle(fontSize: 10, color: Colors.white),),
        //     );
        //   }),
        // ),

        // count构造：固定列/行数网格
        // body: GridView.count(
        //   // scrollDirection: Axis.horizontal, // 滚动方向：水平滚动
        //   crossAxisCount: 3, // 列数或行数
        //   padding: EdgeInsets.all(10),
        //   mainAxisSpacing: 10,
        //   crossAxisSpacing: 10,
        //   children: List.generate(100, (index) {
        //     return Container(
        //       alignment: Alignment.center,
        //       width: double.infinity,
        //       color: Colors.blue,
        //       child: Text('这是第${index + 1}个', style: TextStyle(fontSize: 20, color: Colors.white),),
        //     );
        //   }),
        // ),
      ),
    );
  }
}
