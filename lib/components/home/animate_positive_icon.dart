import 'package:flutter/material.dart';

class AnimatePositiveIcon extends StatefulWidget {
  const AnimatePositiveIcon({Key key, @required this.size}) : super(key: key);

  final double size;

  @override
  _AnimatePositiveIconState createState() => _AnimatePositiveIconState();
}

class _AnimatePositiveIconState extends State<AnimatePositiveIcon>
    with TickerProviderStateMixin {
  AnimationController controller1;
  AnimationController controller2;
  AnimationController controller3;

  Animation<double> animation1;
  Animation<double> animation2;
  Animation<double> animation3;

  Animation<double> currentAnimation;
  Color currentColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    currentColor = Colors.grey[100];
    controller1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    controller2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    controller3 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));

    //动画就是用一个起始状态，到结束状态，然后给一个controller，controller设置多少时间动画结束
    animation1 = Tween(begin: 1.0, end: 0.0).animate(controller1)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.forward(from: 0);
          currentAnimation = animation2;
          currentColor = Colors.redAccent;
        }
      });

    animation2 = Tween(begin: 0.0, end: 1.2).animate(controller2)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller3.forward(from: 0);
          currentAnimation = animation3;
        }
      });

    animation3 = Tween(begin: 1.2, end: 1.0).animate(controller3)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          print("animate33333 finished");
        }
      });
    currentAnimation = animation1;
    controller1.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Icon(
      Icons.favorite,
      size: widget.size * currentAnimation.value,
      color: currentColor,
    ));
  }
}
