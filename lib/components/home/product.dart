import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/viewmodels/home.dart';

class Product extends StatefulWidget {
  final List<GoodsDetailItem> goodsItem;
  const Product({super.key, required this.goodsItem});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemCount: widget.goodsItem.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: getGridItem(index),
        );
      },
    );
  }

  Widget getGridItem(int index) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                widget.goodsItem[index].picture,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  "lib/assets/tehui.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: Text(widget.goodsItem[index].name),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "¥${widget.goodsItem[index].price}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        widget.goodsItem[index].price,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          //中划线
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                    Text(
                      "${widget.goodsItem[index].payCount}人付款",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
