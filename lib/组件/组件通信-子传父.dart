import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(ParentPage());
}

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
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: List.generate(_lists.length, (index) {
              return MenuWidget(values: _lists[index], index: index, delFunc: (i) {
                _lists.removeAt(i);
                setState(() {});
              },);
            }),
          ),
        ),
      ),
    );
  }
}

class MenuWidget extends StatefulWidget {
  final String? values;
  final int index;
  // 设置回调函数，用来传数据给父组件
  final Function(int index) delFunc;
  const MenuWidget({super.key, required this.values, required this.index, required this.delFunc});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(
            '${widget.values}',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        IconButton(onPressed: () {
          widget.delFunc(widget.index);
        }, icon: Icon(Icons.delete), color: Colors.red,)
      ],
    );
  }
}
