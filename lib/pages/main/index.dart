import 'package:flutter/material.dart';
import 'package:flutter_learning/api/user.dart';
import 'package:flutter_learning/pages/main/cart.dart';
import 'package:flutter_learning/pages/main/category.dart';
import 'package:flutter_learning/pages/main/home.dart';
import 'package:flutter_learning/pages/main/mine.dart';
import 'package:flutter_learning/stores/TokenManager.dart';
import 'package:flutter_learning/stores/UserController.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  // 定义下方tab栏资源数据
  final List<Map<String, String>> _tabDataList = [
    {
      "icon": "lib/assets/ic_public_home_normal.png",
      "icon_active": "lib/assets/ic_public_home_active.png",
      'text': '首页',
    },
    {
      "icon": "lib/assets/ic_public_pro_normal.png",
      "icon_active": "lib/assets/ic_public_pro_active.png",
      'text': '分类',
    },
    {
      "icon": "lib/assets/ic_public_cart_normal.png",
      "icon_active": "lib/assets/ic_public_cart_active.png",
      'text': '购物车',
    },
    {
      "icon": "lib/assets/ic_public_my_normal.png",
      "icon_active": "lib/assets/ic_public_my_active.png",
      'text': '我的',
    },
  ];

  // 定义下方tab栏组件数据
  List<BottomNavigationBarItem> _getTabWidget() {
    return List.generate(_tabDataList.length, (int index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tabDataList[index]['icon']!, width: 40, height: 40),
        activeIcon: Image.asset(
          _tabDataList[index]['icon_active']!,
          width: 40,
          height: 40,
        ),
        label: _tabDataList[index]['text'],
      );
    });
  }

  // 定义tab栏激活项索引
  int _currentTabIndex = 0;

  // 定义tab对应的view视图组件
  final List<Widget> _tabViews = [
    HomeView(),
    CategoryView(),
    CartView(),
    MineView(),
  ];

  // 用户信息
  final UserController _userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    _initUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: IndexedStack(index: _currentTabIndex ,children: _tabViews)),
      bottomNavigationBar: BottomNavigationBar(
        items: _getTabWidget(),
        currentIndex: _currentTabIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        onTap: (value) {
          setState(() {
            _currentTabIndex = value;
          });
        },
      ),
    );
  }

  // 初始化用户
  void _initUser() async {
    // 初始化token
    await tokenManager.init();
    if(tokenManager.getToken().isNotEmpty) {
      _userController.updateUserInfo(await userProfileApi());
    }
  }
}
