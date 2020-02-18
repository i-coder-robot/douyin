import 'package:dio/dio.dart';
import 'package:douyin/components/bottom/bottom_bar.dart';
import 'package:douyin/components/city/push_flow.dart';
import 'package:douyin/providers/same_city_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SameCity extends StatelessWidget {
  SameCity({Key key, this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    var rpx = MediaQuery.of(context).size.width / 750;
    SameCityProvider provider = Provider.of<SameCityProvider>(context);
    ScrollController controller = ScrollController();
    //这个地方，如果是provider为空，或者没拿到数据，那么就给他一个空Scaffold，等数据请求到了，会自动切换下面的数据的页面上
    return provider == null || provider.itemsLeft.length == 0
        ? Scaffold()
        : Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            appBar: AppBar(
              title: Text("同城"),
            ),
//            bottomNavigationBar: Container(
//                decoration: BoxDecoration(color: Colors.black),
//                child:
//                    SafeArea(child: BottomBar(selectedIndex: selectedIndex))),
            body: Column(
              children: <Widget>[
                Container(
                  height: 120 * rpx,
                  padding: EdgeInsets.all(40 * rpx),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.near_me,
                            color: Colors.grey[400],
                          ),
                          Text(
                            "自动定位: 北京",
                            style: TextStyle(color: Colors.grey[400]),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "切换",
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          Icon(Icons.arrow_right, color: Colors.grey[400]),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: controller,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10*rpx),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: PushFlow(
                              dataList: provider.itemsLeft,
                              controller: controller,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: PushFlow(
                              dataList: provider.itemsRight,
                              controller: controller,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
