import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

// 入口
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ListPage());
  }
}

// 主页面
class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Page'), centerTitle: true),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // 基本路由页面跳转
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(id: index + 1),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              color: Colors.blue,
              alignment: Alignment.center,
              height: 80,
              child: Text(
                '列表${index + 1}',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          );
        },
        itemCount: 100,
      ),
    );
  }
}

// 二级页面
class DetailPage extends StatefulWidget {
  // 基本路由传参
  final int? id;

  const DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    // 可以直接使用widget获取
    // print(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Page'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            Text("详情${widget.id}", style: TextStyle(fontSize: 20)),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
