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
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            children: [
              TextButton(onPressed: () {
                count-=1;
                setState(() {});
              }, child: Text('减')),
              Text('$count'),
              TextButton(onPressed: () {
                count+=1;
                setState(() {});
              }, child: Text('加'))
            ],
          ),
        ),
      ),
    );
  }
}