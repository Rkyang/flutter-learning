import 'package:flutter/material.dart';
import 'package:flutter_learning/viewmodels/home.dart';

class Category extends StatefulWidget {
  final List<CategoryItem> categoryList;
  const Category({super.key, required this.categoryList});

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
        itemCount: widget.categoryList.length,
        itemBuilder: (context, index) {
          // 创建一个分类项
          CategoryItem item = widget.categoryList[index];
          return Container(
            width: 80,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 233, 231, 231),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(item.picture, width: 80, height: 45,),
                Text(item.name),
              ],
            ),
          );
        },
      ),
    );
  }
}
