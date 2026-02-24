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
        appBar: AppBar(title: Text('Flex组件'), centerTitle: true),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Container(height: 100, color: Colors.blue),
              Expanded(child: Container(height: 100, color: Colors.blueGrey)),
              Container(height: 100, color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}
