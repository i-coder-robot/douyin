import 'package:flutter/material.dart';

class IconText extends StatelessWidget {

  const IconText({Key key,this.iconButton,this.text}):super(key:key);
  final IconButton iconButton;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          iconButton,
          text==""?Container():Text(text,style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
}
