import 'dart:async';

import 'package:flutter/material.dart';

class LoginProvider extends State<StatefulWidget>
    with ChangeNotifier, TickerProviderStateMixin {
  AnimationController controller;
  TextEditingController userNameController;
  Animation<double> backgroundController;
  double opacityMain = 1.0;
  double opacityToChange = 0.0;
  int index=0;
  int indexToChange = 1;
  List<String> imageList;
  Timer interval;

  LoginProvider() {

    userNameController = TextEditingController();

    imageList = List<String>();
    for (var i=0;i<9;i++){
      imageList.add("lib/images/login00"+(i+1).toString());
    }

    interval = Timer.periodic(Duration(seconds: 5), (callback){
      controller.forward(from: 0);
    });
    controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 2000,
        ));



    backgroundController = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        //opacityMain = opacityMain - backgroundController.value;
        opacityMain = 1 - backgroundController.value;
        opacityToChange = backgroundController.value;
        notifyListeners();
      })..addStatusListener((status){
        if (status==AnimationStatus.completed){
          index=index+1;
          indexToChange = indexToChange+1;
          if (index==imageList.length){
            index=0;
          }

          if (indexToChange==imageList.length){
            indexToChange=0;
          }

          opacityMain=1;
          opacityToChange=0;
          notifyListeners();
        }
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    interval.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
