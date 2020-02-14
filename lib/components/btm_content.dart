import 'package:douyin/components/rotate_album.dart';
import 'package:flutter/material.dart';
import 'package:marquee_flutter/marquee_flutter.dart';

class BtmContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              "@美食味道",
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              "我和美食的相遇，也和你们一样，从生命起始就已注定，在生活中一直并行着。 有关美食，我一直以来都是无比热爱的，我将身影遍布各处，妈妈的家常菜灶台，每个城市里的饭店，藏在古老巷子里的小餐",
              style: TextStyle(color: Colors.white),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: <Widget>[
              RotateAlbum(),
              Container(
                width: 138.0,
                height: 30.0,
                child: MarqueeWidget(
                  text: "美食分享和你们一样，从生命起始就已注定",
                  textStyle: new TextStyle(color: Colors.white, fontSize: 16.0),
                  scrollAxis: Axis.horizontal,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
