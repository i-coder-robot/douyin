import 'package:flutter/material.dart';

class AnimateNegativeIcon extends StatefulWidget {
  @override
  _AnimateNegativeIconState createState() => _AnimateNegativeIconState();
}

//做动画要必须加入这个TickerProviderStateMixin，然后设置controller里面的vsync: this
class _AnimateNegativeIconState extends State<AnimateNegativeIcon>
    with TickerProviderStateMixin {



  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
