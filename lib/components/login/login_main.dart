import 'package:douyin/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_box.dart';

class LoginMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var rpx = MediaQuery.of(context).size.width / 750;
    return Scaffold(
      body: Stack(
        //拉伸一下
        fit: StackFit.expand,
        children: <Widget>[
          BackgroundSlideMain(),
          BackgroundSlideToChange(),
          Positioned(
            left: 0,
            top: 250 * rpx,
            child: LoginBox(),
          )
        ],
      ),
    );
  }
}

class BackgroundSlideMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginProvider provider = Provider.of<LoginProvider>(context);

    return Opacity(
        opacity: provider.opacityMain,
        child: Image.asset(
          "lib/images/login00${provider.index}.jpg",
          fit: BoxFit.cover,
        ));
  }
}

class BackgroundSlideToChange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginProvider provider = Provider.of<LoginProvider>(context);
    return Opacity(
        opacity: provider.opacityToChange,
        child: Image.asset(
          "lib/images/login00${provider.indexToChange}.jpg",
          fit: BoxFit.cover,
        ));
  }
}
