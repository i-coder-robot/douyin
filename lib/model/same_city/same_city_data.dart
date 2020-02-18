
import 'package:douyin/model/same_city/same_city_items.dart';

class SameCityData {
  SameCityItems items;

  SameCityData({this.items});

  SameCityData.fromJson(Map<String, dynamic> json) {
    items = json['items'] != null ? new SameCityItems.fromJson(json['items']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items.toJson();
    }
    return data;
  }
}

