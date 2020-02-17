import 'package:douyin/providers/AtUserProvider.dart';
import 'package:douyin/components/bottom/bottom_bar.dart';
import 'package:douyin/pages/home.dart';
import 'package:douyin/providers/recommend_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/friends/friend_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
        primaryColorDark: Colors.black,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var rpx = MediaQuery.of(context).size.width / 750;

    return Scaffold(
      backgroundColor: Colors.black,
      body: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              builder: (content)=>RecommendProvider(),
            ),
            ChangeNotifierProvider(
              builder: (context)=>AtUserProvider(),
            ),
          ],
          child: Home(),
//好友列表，吸顶效果
//          child: FriendList(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: rpx * 100.0,
          decoration: BoxDecoration(color: Colors.black),
          child: BottomBar(),
        ),
      ),
    );
  }
}
