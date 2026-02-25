import 'package:flutter/material.dart';

class Hot extends StatefulWidget {
  const Hot({super.key});

  @override
  State<Hot> createState() => _HotState();
}

class _HotState extends State<Hot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blue,
      height: 150,
      child: Text('爆款', style: TextStyle(fontSize: 20),),
    );
  }
}