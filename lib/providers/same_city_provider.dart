import 'package:dio/dio.dart';
import 'package:douyin/model/same_city/same_city_data.dart';
import 'package:douyin/model/same_city/same_city_item.dart';
import 'package:flutter/material.dart';

class SameCityProvider with ChangeNotifier {
  List<SameCityItem> itemsLeft = List<SameCityItem>();
  List<SameCityItem> itemsRight = List<SameCityItem>();

  SameCityProvider(){
    getPosts();
  }

  double lenLeft = 0;
  double lenRight = 0;

  getPosts() async{
    var dio = Dio();
    Response response = await dio.get("http://192.168.0.104:8080/dySameCity");
    var data = response.data;
    //print(data);

    var d = SameCityData.fromJson(data);
    setPosts(d);
    notifyListeners();
  }

  setPosts(SameCityData sameCityData){
    itemsLeft = sameCityData.items.itemsLeft;
    itemsRight = sameCityData.items.itemsRight;
  }
}
