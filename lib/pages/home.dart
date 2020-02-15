import 'package:douyin/components/home/btm_bar.dart';
import 'package:douyin/components/home/btm_content.dart';
import 'package:douyin/components/home/rotate_album.dart';
import 'package:douyin/components/home/rotate_head_pic.dart';
import 'package:douyin/components/home/top_tab.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var rpx = MediaQuery.of(context).size.width / 750;
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Positioned(
          top: 50 * rpx,
          width: w,
          height: 150 * rpx,
          child: Container(
            decoration: BoxDecoration(color: Colors.black),
            child: TopTab(),
          ),
        ),
        Positioned(
          bottom: 0,
          height: 280 * rpx,
          width: 400 * rpx,
          child: Container(
            child: BtmContent(),
          ),
        ),
        Positioned(
          top: 0.2 * h,
          right: 0,
          width: 0.25 * w,
          height: 0.4 * h,
          child: Container(
            child: getButtonList(),
          ),
        ),
        Positioned(
          width: 0.2 * w,
          height: 0.1 * h,
          bottom: 0,
          right: 0,
          child: Container(
            child: Container(
                child: RotateHeadPic()),
          ),
        )
      ],
    );
  }
}
