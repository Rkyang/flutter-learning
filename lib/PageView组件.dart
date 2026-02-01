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
  PageController _pvController = PageController();
  int _defaultSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('PageView组件'), centerTitle: true),
        body: CustomScrollView(
          slivers: [
            // 包裹普通widget
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    height: 200,
                    color: Colors.blue,
                    child: PageView.builder(
                      controller: _pvController,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Text(
                          '轮播图${index + 1}',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 5,
                        children: List.generate(10, (index) {
                          return GestureDetector(
                            onTap: () {
                              // _pvController.jumpToPage(index);
                              _pvController.animateToPage(index, duration: Duration(seconds: 1), curve: Curves.easeIn);
                              _defaultSelectedIndex = index;
                              setState(() {});
                            },
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                color: _defaultSelectedIndex == index ? Colors.red : Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 粘性吸顶，pinned：固定吸顶
            SliverPersistentHeader(delegate: _stickyCategory(), pinned: true),

            // 滚动列表
            SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.green,
                  child: Text(
                    '列表项${index + 1}',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// 粘性吸顶实现类
class _stickyCategory extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 10, bottom: 10),
      margin: EdgeInsets.only(right: 10),
      child: ListView.builder(
        itemCount: 20,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            color: Colors.blue,
            width: 70,
            child: Text(
              '分类${index + 1}',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }

  // 最大展开高度
  @override
  double get maxExtent => 70;

  // 最小折叠高度
  @override
  double get minExtent => 50;

  // 是否重新加载数据
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
