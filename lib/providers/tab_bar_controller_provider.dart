

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarControllerProvider extends State<StatefulWidget> with ChangeNotifier, TickerProviderStateMixin{

  TabController controller;

  TabBarControllerProvider(){
    controller = TabController(vsync: this,length: 2,initialIndex: 1);
  }

  setTabController(controller){
    controller=controller;
    notifyListeners();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}