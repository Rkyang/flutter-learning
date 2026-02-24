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

  ScrollController _scsvController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('登录'), centerTitle: true),
        body: Stack(
            children: [
              SingleChildScrollView(
                controller: _scsvController,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: List.generate(100, (index) {
                    return Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 20),
                      color: Colors.blue,
                      height: 50,
                      width: double.infinity,
                      child: Text(
                        '这是第${index + 1}个',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    );
                  }),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    // 无特效
                    // _scsvController.jumpTo(_scsvController.position.maxScrollExtent);
                    // 有特效
                    _scsvController.animateTo(
                      _scsvController.position.maxScrollExtent, // 位置
                      duration: Duration(seconds: 3), // 时间
                      curve: Curves.easeIn // 动画
                    );
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Text(
                      '去底部',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    // 无特效
                    // _scsvController.jumpTo(0);
                    // 有特效
                    _scsvController.animateTo(
                      0, // 位置
                      duration: Duration(seconds: 3), // 时间
                      curve: Curves.easeInCubic // 动画
                    );
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Text(
                      '去顶部',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )
              ),
            ],
          ),
      ),
    );
  }
}
