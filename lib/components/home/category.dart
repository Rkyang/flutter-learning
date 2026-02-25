import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: 80,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 5),
            color: Colors.blue,
            child: Text(
              '分类$index',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          );
        },
      ),
    );
  }
}
