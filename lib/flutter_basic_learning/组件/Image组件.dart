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
        appBar: AppBar(title: Text('Text组件'), centerTitle: true),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('lib/images/img1.jpg'), height: 300, width: 300,),
              SizedBox(height: 10),
              Image(image: NetworkImage('https://pic2.zhimg.com/v2-4065aa9eb440369bddd7976632c6c2b9_1440w.jpg'), height: 400, width: 500,),
            ],
          ),
        ),
      ),
    );
  }
}
