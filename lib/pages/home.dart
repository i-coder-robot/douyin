import 'package:douyin/components/bottom/bottom_bar.dart';
import 'package:douyin/components/enums/types.dart';
import 'package:douyin/components/home/btm_content.dart';
import 'package:douyin/components/home/button_list.dart';
import 'package:douyin/components/home/rotate_album.dart';
import 'package:douyin/components/home/rotate_head_pic.dart';
import 'package:douyin/components/home/top_tab.dart';
import 'package:douyin/components/swiper/swiper_home.dart';
import 'package:douyin/providers/recommend_provider.dart';
import 'package:douyin/providers/tab_bar_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  const Home({Key key}):super(key:key);


  @override
  Widget build(BuildContext context) {
    var rpx = MediaQuery.of(context).size.width / 750;
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    TabBarControllerProvider provider =
    Provider.of<TabBarControllerProvider>(context);
    return Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            child: TabBarView(
              controller: provider.controller,
              children: <Widget>[
                SwiperHome(type: Types.Follow,),
                SwiperHome(type: Types.Recommend,)
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          width: w,
          height: 150 * rpx,
          child: Container(
            child: SafeArea(child: TopTab()),
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
            child: ButtonList(),
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
