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
        body: ListView.builder(
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(top: 10),
              height: 100,
              alignment: Alignment.center,
              width: double.infinity,
              color: Colors.blue,
              child: Text('这是第${index + 1}个', style: TextStyle(fontSize: 30, color: Colors.white),),
            );
          },
        ),
      ),
    );
  }
}
