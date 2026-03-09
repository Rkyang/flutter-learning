import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_learning/viewmodels/home.dart';

class Recommend extends StatefulWidget {
  final SpecialOfferResult specialOfferResult;

  const Recommend({super.key, required this.specialOfferResult});

  @override
  State<Recommend> createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage('lib/assets/home_cmd_sm.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          _getTopTitle(),
          Row(
            children: [
              _getBottomLeftContent(),
              SizedBox(width: 15),
              _getBottomRightContent(),
              SizedBox(width: 5,)
            ],
          ),
        ],
      ),
    );
  }

  Widget _getTopTitle() {
    return Padding(
      padding: EdgeInsetsGeometry.only(top: 10, left: 10),
      child: Row(
        spacing: 10,
        children: [
          Text(
            '特惠推荐',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text('精选省攻略', style: TextStyle(color: Colors.grey, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _getBottomLeftContent() {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 10),
      width: 100,
      height: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image(
          image: AssetImage('lib/assets/home_cmd_inner.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _getBottomRightContent() {
    List<SubType>? subTypes = widget.specialOfferResult.subTypes;
    if (subTypes.isNotEmpty) {
      List<GoodsItem> itemList = subTypes.first.goodsItems.items
          .take(3)
          .toList();

      return Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          spacing: 15,
          children: List.generate(itemList.length, (index) {
            return Expanded(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      // width: 100,
                      height: 120,
                      image: NetworkImage(itemList[index].picture),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image(
                          image: AssetImage('lib/assets/home_cmd_sm.png'),
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    // width: 100,
                    height: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '￥${itemList[index].price}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      );
    }
    return Container();
  }
}
