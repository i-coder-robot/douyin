import 'package:douyin/components/city/same_city.dart';
import 'package:douyin/components/login/login_main.dart';
import 'package:douyin/providers/AtUserProvider.dart';
import 'package:douyin/components/bottom/bottom_bar.dart';
import 'package:douyin/pages/home.dart';
import 'package:douyin/providers/login_provider.dart';
import 'package:douyin/providers/recommend_provider.dart';
import 'package:douyin/providers/same_city_provider.dart';
import 'package:douyin/providers/tab_bar_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'components/friends/friend_list.dart';
import 'components/refresh/refresh.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates:  [
        // 这行是关键
        RefreshLocalizations.delegate,
        //GlobalWidgetsLocalizations.delegate,
        //GlobalMaterialLocalizations.delegate
      ],
        supportedLocales: [
          const Locale('en'),
          const Locale('zh'),
        ],
        localeResolutionCallback:
            (Locale locale, Iterable<Locale> supportedLocales) {
          //print("change language");
          return locale;
        },
      title: 'Flutter Demo',
      theme: ThemeData(
        //默认色
//        primaryColor: Colors.black,
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
//      backgroundColor: Colors.black,
      body: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              builder: (content)=>RecommendProvider(),
            ),
            ChangeNotifierProvider(
              builder: (context)=>AtUserProvider(),
            ),
            ChangeNotifierProvider(
              builder:(context)=>SameCityProvider(),
            ),
            ChangeNotifierProvider(
              builder: (context)=>TabBarControllerProvider(),
            ),
            ChangeNotifierProvider(
              builder: (context)=>LoginProvider(),
            ),
          ],
//同城
//          child: SameCity(selectedIndex: 1,),
// 抖音首页
//          child: Home(),
//刷新
//          child: MyRefresh(),
//好友列表，吸顶效果
//          child: FriendList(),
//登录页
          child: LoginMain(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: rpx * 100.0,
          decoration: BoxDecoration(color: Colors.black),
          child: BottomBar(selectedIndex: 0,),
        ),
      ),
    );
  }
}
