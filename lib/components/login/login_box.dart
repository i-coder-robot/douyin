import 'dart:ui';

import 'package:douyin/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'LoginTextField.dart';
import 'login_title.dart';

class LoginBox extends StatefulWidget {
  @override
  _LoginBoxState createState() => _LoginBoxState();
}

class _LoginBoxState extends State<LoginBox> {
  @override
  Widget build(BuildContext context) {
    TextEditingController pwdController = TextEditingController();
    var rpx = MediaQuery.of(context).size.width / 750;
    var margin = 45 * rpx;
    LoginProvider provider = Provider.of<LoginProvider>(context);
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10 * rpx, sigmaY: 5 * rpx),
      child: Container(
        width: 750 * rpx - 2 * margin,
        margin: EdgeInsets.symmetric(horizontal: margin),
        padding: EdgeInsets.symmetric(horizontal: 20 * rpx, vertical: 20 * rpx),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 30 * rpx, vertical: 20 * rpx),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20 * rpx),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20 * rpx,
                      color: Colors.grey[100],
                      offset: Offset(20 * rpx, 20 * rpx),
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20*rpx,
                  ),
                  LoginTitle(
                    text: "账号/手机号",
                  ),
                  LoginTextField(
                    controller: provider.userNameController,
                    obsecure: false,
                    width: 750*rpx-2*margin,
                    icon: Icon(Icons.face,size: 40*rpx,),
                    correct: true,
                    hintText: "请输入您的账号/手机号",
                  ),
                  LoginTitle(
                    text: "密码",
                  ),
                  LoginTextField(
                    controller: pwdController,
                    obsecure: true,
                    width: 750 * rpx - 2 * margin,
                    correct: true,
                    icon: Icon(
                      Icons.lock,
                      size: 40 * rpx,
                    ),
                    hintText: "请输入您的密码",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Text("注册账号"),
                        onPressed: () {},
                      ),
                      FlatButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Text("忘记密码？"),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30 * rpx),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(20 * rpx)),
                              height: 90 * rpx,
                              // width: 750*rpx-2*margin,
                              padding: EdgeInsets.all(0),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20 * rpx)),
                                color: Colors.green[500],
                                child: Text(
                                  "登录",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 35 * rpx),
                                ),
                                onPressed: () {
//                                  provider.addNewUser();
                                },
                              ),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20 * rpx),
                    child: Center(
                        child: FlatButton(
                          onPressed: () {
//                            provider.changeLoginBox();
                          },
                          child: Text(
                            "本机一键登录",
                            style: TextStyle(
                                fontSize: 30 * rpx,
                                decoration: TextDecoration.underline),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
