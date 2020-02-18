import 'package:douyin/components/bottom/add_icon.dart';
import 'package:douyin/components/city/same_city.dart';
import 'package:douyin/components/home/icon_text.dart';
import 'package:douyin/utils/utils.dart';
import 'package:flutter/material.dart';

//class BottomBar extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Row(
//      mainAxisAlignment: MainAxisAlignment.spaceAround,
//      children: <Widget>[
//        //不需要其他控件的，就可以正常排列了
//        getBtmContentText("首页", true),
//        getBtmContentText("同城", false),
//        AddIcon(),
//        getBtmContentText("消息", false),
//        getBtmContentText("我", false),
//      ],
//    );
//  }
//}

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();

  BottomBar({Key key, this.selectedIndex});

  final int selectedIndex;
}

class _BottomBarState extends State<BottomBar> {
  List<bool> selected = List<bool>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (var i = 0; i < 5; i++) {
      selected.add(false);
    }
    selected[widget.selectedIndex] = true;
  }

  tapItem(index) {
    setState(() {
      for (var i = 0; i < 5; i++) {
        selected[i] = false;
      }
      selected[index] = true;
    });
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SameCity(selectedIndex: index,)));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        //不需要其他控件的，就可以正常排列了
        Expanded(
          flex: 1,
          child: getBtmContentText("首页", selected[0], () {
            tapItem(0);
          }),
        ),
        Expanded(
            flex: 1,
            child: getBtmContentText("同城", selected[1], () {
              tapItem(1);
            })),
        Expanded(
          flex: 1,
          child:  AddIcon(),
        ),
        Expanded(
            flex: 1,
            child: getBtmContentText("消息", selected[2], () {
              tapItem(2);
            })),
        Expanded(
            flex: 1,
            child: getBtmContentText("我", selected[3], () {
              tapItem(3);
            })),
      ],
    );
  }
}

getBtmContentText(String content, bool isSelected, tapFunc) {
  return FlatButton(
    onPressed: () {
      tapFunc();
    },
    child: Text(
      "$content",
      style: isSelected
          ? TextStyle(
              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold)
          : TextStyle(color: Colors.grey[400], fontSize: 12.0),
    ),
  );
}
