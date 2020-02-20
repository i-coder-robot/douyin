import 'package:flutter/material.dart';


class LoginTitle extends StatelessWidget {

  LoginTitle({Key key,@required this.text}): super(key:key);
  final String text;

  @override
  Widget build(BuildContext context) {
    var rpx = MediaQuery.of(context).size.width/750;
    return Container(
      child: Text(
        text,
        style: TextStyle(fontFamily: "Pangmen",fontSize: 48*rpx),
      ),
    );
  }
}
