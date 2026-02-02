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
        appBar: AppBar(title: Text('Stack组件'), centerTitle: true),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,
          child: Stack(
            children: [
              Container(color: Colors.blueGrey, height: 300, width: 300),
              Positioned(
                top: 10,
                left: 10,
                child: Container(color: Colors.red, height: 100, width: 100),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: Container(color: Colors.blue, height: 100, width: 100),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
