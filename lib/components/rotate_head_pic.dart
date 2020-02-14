import 'package:flutter/material.dart';

class RotateHeadPic extends StatefulWidget {
  @override
  _RotateHeadPicState createState() => _RotateHeadPicState();
}

class _RotateHeadPicState extends State<RotateHeadPic>
    with SingleTickerProviderStateMixin {
  AnimationController _controller2;
  var animation2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller2 =
        AnimationController(vsync: this, duration: Duration(seconds: 6));
    animation2 = RotationTransition(
      child: Container(
        width: 60,
        height: 60,
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              "https://upload.jianshu.io/users/upload_avatars/7211202/85f011fa-1101-4ccf-8f74-748f98692631?imageMogr2/auto-orient/strip|imageView2/1/w/80/h/80/format/webp"),
        ),
      ),
      turns: Tween(begin: 0.0, end: 1.0).animate(_controller2)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _controller2.forward(from: 0.0);
          }
        }),
    );
    _controller2.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return animation2;
  }
}
