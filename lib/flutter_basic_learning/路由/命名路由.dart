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
    return MaterialApp(
      // 指定初始路由
      initialRoute: "/list",
      // 命名路由
      routes: {
        '/list': (context) => ListPage(),
        '/detail': (context) => DetailPage(),
      },
    );
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
              // 命名路由页面跳转，附带路由参数
              Navigator.pushNamed(
                context,
                '/detail',
                arguments: {"id": index + 1},
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
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String _id = '';

  @override
  void initState() {
    super.initState();
    // 在异步微任务中获取命名路由参数
    Future.microtask(() {
      if (ModalRoute.of(context) != null) {
        Map<String, dynamic> params =
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        // 参数传递时是什么类型，接收时要进行处理，否则报错
        _id = params['id'].toString();
        // 刷新数据状态
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Page'), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("详情${_id}", style: TextStyle(fontSize: 20)),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Back'),
          ),
        ],
      ),
    );
  }
}
