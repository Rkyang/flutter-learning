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
        body: Container(
          alignment: Alignment.center,
          width: 200,
          height: 200,
          margin: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.blue,
            border: BoxBorder.all(
              color: Colors.amber,
              width: 3
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          transform: Matrix4.rotationZ(0.07),
          child: Text(
            'Hello Container!',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}