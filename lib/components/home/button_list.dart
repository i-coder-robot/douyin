import 'package:douyin/providers/recommend_provider.dart';
import 'package:douyin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'animate_positive_icon.dart';
import 'icon_text.dart';

class ButtonList extends StatefulWidget {
  @override
  _ButtonListState createState() => _ButtonListState();
}

class _ButtonListState extends State<ButtonList> {
  @override
  Widget build(BuildContext context) {
    var rpx = MediaQuery.of(context).size.width / 750;
    RecommendProvider provider = Provider.of<RecommendProvider>(context);
    double iconSize = 70 * rpx;
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 60,
            height: 70,
            child: Stack(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://pic3.zhimg.com/v2-28ccd0256a1ff532bab628f913bea219_im.jpg"),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 17.5,
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(25)),
                    child: Icon(
                      Icons.add,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          //红心
          IconText(
              iconButton: IconButton(
                icon: AnimatePositiveIcon(
                  size: iconSize,
                ),
                onPressed: () {
                  provider.tapFav();
                },
              ),
              text: "${provider.favCount}"),
          //回复
          IconText(
              iconButton: IconButton(
                icon: Icon(
                  Icons.comment,
                  size: 50.0,
                  color: Colors.white,
                ),
                onPressed: () {
                  showBottom(context, provider);
                },
              ),
              text: "111"),
          IconText(
              iconButton: IconButton(
                icon: Icon(
                  Icons.reply,
                  size: 50.0,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              text: ""),
        ],
      ),
    );
  }
}
