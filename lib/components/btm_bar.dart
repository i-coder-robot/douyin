import 'package:douyin/components/add_icon.dart';
import 'package:douyin/components/icon_text.dart';
import 'package:flutter/material.dart';

class BtmBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        //不需要其他控件的，就可以正常排列了
        getBtmContentText("首页", true),
        getBtmContentText("同城", false),
        AddIcon(),
        getBtmContentText("消息", false),
        getBtmContentText("我", false),
      ],
    );
  }
}

getBtmContentText(String content, bool isSelected) {
  return Text(
    "$content",
    style: isSelected
        ? TextStyle(
            color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold)
        : TextStyle(color:Colors.grey[400],fontSize: 14.0),
  );
}

getButtonList() {
  return Column(
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
      IconText(icon: Icon(Icons.favorite,size: 50.0,color: Colors.redAccent,), text: "999W"),
      IconText(icon: Icon(Icons.feedback,size: 50.0,color: Colors.white,), text: ""),
      IconText(icon: Icon(Icons.reply,size: 50.0,color: Colors.white,), text: ""),
    ],
  );
}
