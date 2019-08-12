import 'package:flutter/material.dart';
// import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var woah;

  Widget red() {
    return Container(
      width: 200,
      height: 200,
      color: Colors.red,
    );
  }

  Widget green() {
    return Container(
      width: 200,
      height: 200,
      color: Colors.green,
    );
  }

  @override
  void initState() {
    super.initState();
    woah = red();
  }

  delay() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      woah = green();
    });
  }

  @override
  Widget build(BuildContext context) {
    delay();
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            woah,
          ],
        ),
      ),
    );
  }
}
