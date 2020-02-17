import 'dart:async';

import 'package:flutter/material.dart';

class AnimateNegativeIcon extends StatefulWidget {
  @override
  _AnimateNegativeIconState createState() => _AnimateNegativeIconState();

  AnimateNegativeIcon(
      {Key key,
      @required this.size,
      @required this.icon,
      @required this.startColor,
      @required this.endColor,
      this.callBack})
      : super(key: key);
  final double size;
  final IconData icon;
  final VoidCallback callBack;
  final Color startColor;
  final Color endColor;
}

//做动画要必须加入这个TickerProviderStateMixin，然后设置controller里面的vsync: this
class _AnimateNegativeIconState extends State<AnimateNegativeIcon>
    with TickerProviderStateMixin {
  AnimationController controller1;
  AnimationController controller2;

  Animation<double> animation1;
  Animation<double> animation2;

  Animation<double> currentAnimation;
  Color currentColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    currentColor = widget.startColor;
    controller1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    controller2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));

    //动画就是用一个起始状态，到结束状态，然后给一个controller，controller设置多少时间动画结束
    animation1 = Tween(begin: 1.0, end: 1.2).animate(controller1)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.forward(from: 0);
          currentAnimation = animation2;
          currentColor = widget.endColor;
        }
      });

    animation2 = Tween(begin: 1.2, end: 1.0).animate(controller2)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Timer(Duration(milliseconds: 100), () {
            widget.callBack();
          });
        }
      });

    currentAnimation = animation1;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
//          icon:Icon(Icons.favorite,
//          size: widget.size * currentAnimation.value,
//          color: currentColor,),
      icon: Icon(
        widget.icon,
        size: widget.size * currentAnimation.value,
        color: currentColor,
      ),
      onPressed: () {
        controller1.forward(from: 0);
      },
    );
  }
}
