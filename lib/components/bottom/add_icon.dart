import 'package:flutter/material.dart';

class AddIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var rpx = MediaQuery.of(context).size.width/750;
    var iconHeight = 60*rpx;
    var totalWidth = 50*rpx;
    var eachSide = 8*rpx;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14*rpx),
      height: iconHeight,
      width: 150*rpx,
      child: Stack(
        children: <Widget>[
          Positioned(
            width: totalWidth,
            height: iconHeight,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.cyan,
                  //圆角是加到每个层上的Container上设置
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
          Positioned(
            width: 50,
            height: 30,
            right: 2,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  //圆角是加到每个层上的Container上设置
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
          Positioned(
            width: 50,
            height: 30,
            right: 5,
            child: Container(
              child: Icon(Icons.add),
              decoration: BoxDecoration(
                  color: Colors.white,
                  //圆角是加到每个层上的Container上设置
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ],
      ),
    );
  }
}
