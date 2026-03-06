import 'package:flutter/material.dart';
import 'package:flutter_learning/viewmodels/home.dart';

class Hot extends StatefulWidget {
  final String mainTitle;
  final String subTitle;
  final Color backgroundColor;
  final SpecialOfferResult hotList;
  const Hot({
    super.key,
    required this.mainTitle,
    required this.subTitle,
    required this.backgroundColor,
    required this.hotList,
  });

  @override
  State<Hot> createState() => _HotState();
}

class _HotState extends State<Hot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _getTopTitle(),
          Row(children: [_getBottomRightContent()]),
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
            widget.mainTitle,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            widget.subTitle,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _getBottomRightContent() {
    List<SubType>? subTypes = widget.hotList.subTypes;
    if (subTypes.isNotEmpty) {
      List<GoodsItem> itemList = subTypes.first.goodsItems.items
          .take(2)
          .toList();

      return Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(itemList.length, (index) {
            return Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    width: 100,
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
                  width: 100,
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
            );
          }),
        ),
      );
    }
    return Container();
  }
}
