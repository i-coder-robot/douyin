import 'dart:math';

import 'package:douyin/model/same_city/same_city_item.dart';
import 'package:flutter/material.dart';

class PushFlow extends StatelessWidget {
  const PushFlow({Key key, this.dataList, this.controller}) : super(key: key);
  final List<SameCityItem> dataList;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    var rpx = MediaQuery.of(context).size.width/750;
    var outPadding = 10*rpx;
    var eachSide=2*rpx;
    return ListView.builder(
        controller: controller,
        shrinkWrap: true,
        itemCount: dataList.length,
        itemBuilder: (BuildContext context,int index){
            var currentSameCity = dataList[index];
            return Container(
              margin: EdgeInsets.only(bottom: 10*rpx),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 345*rpx,
                        padding: EdgeInsets.symmetric(horizontal: eachSide),
                        height: 345*rpx*currentSameCity.random/10,
                        child: Image.network(currentSameCity.photoAddr,fit: BoxFit.fitWidth,),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: 345*rpx,
                          height: 60*rpx,
                          padding: EdgeInsets.all(eachSide+10*rpx),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(Icons.near_me,color: Colors.grey[400],size: 32*rpx,),
                                  Text(currentSameCity.distance,style: TextStyle(color:Colors.grey[400],fontSize: 26*rpx),),
                                ],
                              ),
                              Container(
                                width: 40*rpx,
                                height: 40*rpx,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(currentSameCity.avatarUrl),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10*rpx),
                    child: Text(
                      currentSameCity.desc,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white,fontSize: 26*rpx),
                    ),
                  )
                ],
              ),
            );
    });
  }
}
