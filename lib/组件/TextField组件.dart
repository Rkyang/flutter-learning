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

  TextEditingController _accController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('登录'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            children: [
              TextField(
                controller: _accController,
                decoration: InputDecoration(
                  hintText: '请输入账号',
                  contentPadding: EdgeInsets.only(left: 20),
                  fillColor: const Color.fromARGB(255, 200, 201, 202),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25)
                  )
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: _pwdController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '请输入密码',
                  fillColor: Color.fromARGB(255, 200, 201, 202),
                  filled: true,
                  contentPadding: EdgeInsets.only(left: 20),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25)
                  )
                ),
              ),
              SizedBox(height: 30,),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25)
                ),
                child: TextButton(onPressed: () {
                  print('login：${_accController.text}, ${_pwdController.text}');
                }, child: Text('登录', style: TextStyle(fontSize: 20, color: Colors.white),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}