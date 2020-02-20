import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  LoginTextField(
      {Key key,
      @required this.controller,
      @required this.obsecure,
      @required this.icon,
      @required this.width,
      @required this.hintText,
      @required this.correct})
      : super(key: key);

  final TextEditingController controller;
  final bool obsecure;
  final Icon icon;
  final double width;
  final String hintText;
  final bool correct;

  @override
  Widget build(BuildContext context) {
    var rpx = MediaQuery.of(context).size.width / 750;
    var iconWidth = 40*rpx;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25*rpx),
      width: width,
      child: Row(
        children: <Widget>[
          Container(
            width: width-iconWidth-120*rpx,
            child: TextField(
              controller: controller,
              obscureText: obsecure,
              decoration: InputDecoration(
                border: InputBorder.none,icon: icon,hintText: hintText
              ),
              style: TextStyle(fontSize: 35*rpx),
            ),
          ),
          correct?Container():Container(
            child: Icon(Icons.close,size: iconWidth,color: Colors.redAccent,),
          )
        ],
      ),
    );
  }
}
