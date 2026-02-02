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
              Text(
                'Hello, Flutter!',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.red,
                ),
              ),
              SizedBox(height: 20),
              Text(
                '222Hello, Flutter!Hello, Flutter!Hello, Flutter!Hello, Flutter!Hello, Flutter!Hello, Flutter!Hello, Flutter!Hello, Flutter!Hello, Flutter!Hello, Flutter!',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.yellow,
                ),
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text.rich(
                TextSpan(
                  text: 'Hello ',
                  children: [
                    TextSpan(
                      text: 'Flutter',
                      style: TextStyle(color: Colors.green),
                    ),
                    TextSpan(text: '!'),
                  ],
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w900,
                    fontSize: 50,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.yellow,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
