import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/goodsList",
      routes: {
        "/goodsList": (context) => GoodList() 
      },
      // 路由表中不存在的路由，会进入这里
      onGenerateRoute: (settings) {
        if (settings.name == '/cartList') {
          bool isLogin = false;
          if (isLogin) {
            return MaterialPageRoute(builder: (context) => CartList());
          } else {
            return MaterialPageRoute(builder: (context) => LoginPage());
          }
        }
      },
    );
  }
}

// 商品列表
class GoodList extends StatefulWidget {
  const GoodList({super.key});

  @override
  State<GoodList> createState() => _GoodListState();
}

class _GoodListState extends State<GoodList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品列表"),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(onPressed: (){
          Navigator.pushNamed(context, '/cartList');
        }, child: Text('加入购物车', style: TextStyle(fontSize: 20),)),
      ),
    );
  }
}

// 购物车列表
class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车列表"),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(onPressed: (){}, child: Text('去支付', style: TextStyle(fontSize: 20),)),
      ),
    );
  }
}

// 登录页
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(onPressed: (){}, child: Text('登录', style: TextStyle(fontSize: 20),)),
      ),
    );
  }
}