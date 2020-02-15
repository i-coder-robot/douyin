import 'package:flutter/material.dart';

class RotateAlbum extends StatefulWidget {
  @override
  _RotateAlbumState createState() => _RotateAlbumState();
}

class _RotateAlbumState extends State<RotateAlbum>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  var animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //设置动画，duration 4秒转一圈
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    //Tween<T extends dynamic> extends Animatable<T>
    animation = SizeTransition(
      axis: Axis.horizontal,
        child: Icon(
          Icons.music_note,
          color: Colors.white,
        ),
        sizeFactor: _controller..addStatusListener((status){
          if (status==AnimationStatus.completed){
            _controller.forward(from: 0.0);
          }
        }),
       );
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return animation;
  }
}
