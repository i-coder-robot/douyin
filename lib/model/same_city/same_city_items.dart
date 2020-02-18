
import 'package:douyin/model/same_city/same_city_item.dart';

class SameCityItems {
  List<SameCityItem> itemsLeft;
  List<SameCityItem> itemsRight;

  SameCityItems({this.itemsLeft, this.itemsRight});

  SameCityItems.fromJson(Map<String, dynamic> json) {
    if (json['items1'] != null) {
      itemsLeft = new List<SameCityItem>();
      json['items1'].forEach((v) {
        itemsLeft.add(new SameCityItem.fromJson(v));
      });
    }
    if (json['items2'] != null) {
      itemsRight = new List<SameCityItem>();
      json['items2'].forEach((v) {
        itemsRight.add(new SameCityItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.itemsLeft != null) {
      data['items1'] = this.itemsLeft.map((v) => v.toJson()).toList();
    }
    if (this.itemsRight != null) {
      data['items2'] = this.itemsRight.map((v) => v.toJson()).toList();
    }
    return data;
  }
}