import 'package:flutter/material.dart';

class AddIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 60,
      child: Stack(
        children: <Widget>[
          Positioned(
            width: 50,
            height: 30,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.cyan,
                  //圆角是加到每个层上的Container上设置
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
          Positioned(
            width: 50,
            height: 30,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  //圆角是加到每个层上的Container上设置
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
          Positioned(
            width: 50,
            height: 30,
            right: 5,
            child: Container(
              child: Icon(Icons.add),
              decoration: BoxDecoration(
                  color: Colors.white,
                  //圆角是加到每个层上的Container上设置
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ],
      ),
    );
  }
}
