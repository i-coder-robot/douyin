import 'package:douyin/components/home/btm_bar.dart';
import 'package:douyin/pages/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
//        primarySwatch: Colors.blue,
        primaryColor: Colors.black,
          primaryColorDark:Colors.black,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var rpx = MediaQuery.of(context).size.width / 750;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Home(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: rpx * 100.0,
          decoration: BoxDecoration(color: Colors.black),
          child: BtmBar(),
        ),
      ),
    );
  }
}
