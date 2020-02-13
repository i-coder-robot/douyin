import 'package:douyin/components/add_icon.dart';
import 'package:flutter/material.dart';

class BtmBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        //不需要其他控件的，就可以正常排列了
        getBtmContentText("首页",true),
        getBtmContentText("同城",false),
        AddIcon(),
        getBtmContentText("消息",false),
        getBtmContentText("我",false),
      ],
    );
  }
}

getBtmContentText(String content, bool isSelected) {
  return Text("$content", style: isSelected
      ? TextStyle(color: Colors.white, fontSize: 18.0,fontWeight: FontWeight.bold)
      : TextStyle(fontSize: 14.0),);
}