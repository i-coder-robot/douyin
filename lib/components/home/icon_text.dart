import 'package:flutter/material.dart';
import 'animated_icon_widget.dart';

class IconText extends StatelessWidget {

  const IconText({Key key,this.icon,this.text}):super(key:key);
  final AnimatedIconWidget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          icon,
          text==""?Container():Text(text,style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
}
