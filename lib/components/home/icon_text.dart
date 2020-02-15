import 'package:flutter/material.dart';

class IconText extends StatelessWidget {

  const IconText({Key key,this.icon,this.text}):super(key:key);
  final Icon icon;
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
