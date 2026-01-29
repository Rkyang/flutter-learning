import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      title: 'flutter',
      // theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Head'),
          centerTitle: true
        ),
        body: Container(
          alignment: Alignment.center,
          child: Text('Center'),
        ),
        bottomNavigationBar: Container(
          height: 80,
          alignment: Alignment.center,
          child: Text('Bottom'),
        ),
      )
    ),
  );
}
