import 'package:douyin/components/enums/types.dart';
import 'package:douyin/model/same_city/same_city_item.dart';
import 'package:douyin/providers/same_city_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';


class SwiperHome extends StatefulWidget {

  SwiperHome({Key key,@required this.type}):super(key:key);
  final Types type;

  @override
  _SwiperHomeState createState() => _SwiperHomeState();
}

class _SwiperHomeState extends State<SwiperHome> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    var rpx = MediaQuery.of(context).size.width/750;
    SameCityProvider provider = Provider.of<SameCityProvider>(context);
    List<SameCityItem> items = List<SameCityItem>();
    if (widget.type == Types.Follow){
      items= provider.itemsRight;
    }else{
      items= provider.itemsLeft;
    }
    return Swiper(
      loop: false,
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (BuildContext context,int index){
        var current = items[index];
        return Image.network(current.photoAddr,fit: BoxFit.cover,);
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}


//class SwiperHome extends StatelessWidget {
//
//  SwiperHome({Key key,@required this.type}):super(key:key);
//  final Types type;
//
//  @override
//  Widget build(BuildContext context) {
//    var rpx = MediaQuery.of(context).size.width/750;
//    SameCityProvider provider = Provider.of<SameCityProvider>(context);
//    List<SameCityItem> items = List<SameCityItem>();
//    if (type == Types.Follow){
//      items= provider.itemsRight;
//    }else{
//      items= provider.itemsLeft;
//    }
//    return Swiper(
//      loop: false,
//      scrollDirection: Axis.vertical,
//      itemCount: items.length,
//      itemBuilder: (BuildContext context,int index){
//        var current = items[index];
//        return Image.network(current.photoAddr,fit: BoxFit.fitWidth,);
//      },
//    );
//  }
//}
