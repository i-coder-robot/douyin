import 'package:flutter/material.dart';

class TopTab extends StatefulWidget {
  @override
  _TopTabState createState() => _TopTabState();
}

class _TopTabState extends State<TopTab> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(vsync: this, length: 2, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    var rpx = MediaQuery.of(context).size.width/750;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Row(
            children: <Widget>[
              //利用row，内部加入SizedBox来增加宽度
              SizedBox(width: 10,),
              Icon(
                Icons.search,
                size: rpx*60,
                color: Colors.white,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 8,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TabBar(
              // The color of the line that appears below the selected tab.
              // 所选标签下方显示的线条颜色。
              indicatorColor: Colors.white,
              // The horizontal padding for the line that appears below the selected tab.
              // 所选选项卡下方显示的行的水平填充。此处控制每个Tab的空间padding，
              indicatorPadding: EdgeInsets.symmetric(horizontal: 25.0),
              // The text style of the selected tab labels.
              labelStyle: TextStyle(color: Colors.white, fontSize: 25.0),
              // The text style of the unselected tab labels
              unselectedLabelStyle:
                  TextStyle(color: Colors.grey[700], fontSize: 20.0),
              controller: _controller,
              tabs: <Widget>[
                Text("关注"),
                Text("推荐"),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: <Widget>[
              //利用row，内部加入SizedBox来增加宽度
              SizedBox(width: 10.0,),
              Icon(
                Icons.live_tv,
                size: rpx * 60,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
