import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(ParentPage());
}

// 有状态组件-父组件
class ParentPage extends StatefulWidget {
  const ParentPage({super.key});

  @override
  State<ParentPage> createState() => _ParentPageState();
}

class _ParentPageState extends State<ParentPage> {
  List<String> _lists = ['v1', 'v2', 'v3', 'v4', 'v5', 'v6', 'v7'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text('父组件', style: TextStyle(fontSize: 30, color: Colors.blue)),
              ChildNoStateWidget(msg: '父组件传无状态子组件的msg'),
              ChildStateWidget(msg: '父组件传给有状态子组件的msg'),
              SizedBox(
                height: 700,
                width: double.infinity,
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: List.generate(_lists.length, (index) {
                    return MenuWidget(values: _lists[index]);
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 无状态组件-子组件
class ChildNoStateWidget extends StatelessWidget {
  final String? msg; // 必须使用final修饰
  const ChildNoStateWidget({super.key, this.msg});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '无状态子组件： $msg',
        style: TextStyle(fontSize: 18, color: Colors.red),
      ),
    );
  }
}

// 有状态组件-子组件
class ChildStateWidget extends StatefulWidget {
  final String? msg;
  const ChildStateWidget({super.key, required this.msg}); // required:表示该属性必填

  @override
  State<ChildStateWidget> createState() => _ChildStateWidgetState();
}

class _ChildStateWidgetState extends State<ChildStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // 使用widget获取属性
      child: Text(
        '有状态子组件： ${widget.msg}',
        style: TextStyle(fontSize: 15, color: Colors.red),
      ),
    );
  }
}

// 案例
class MenuWidget extends StatefulWidget {
  final String? values;
  const MenuWidget({super.key, required this.values});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(
        '${widget.values}',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
