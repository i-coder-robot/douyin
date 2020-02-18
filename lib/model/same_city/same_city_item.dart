
class SameCityItem {
  String id;
  String title;
  String photoAddr;
  String distance;
  String avatarUrl;
  String location;
  int random;
  String desc;

  SameCityItem(
      {this.id,
        this.title,
        this.photoAddr,
        this.distance,
        this.avatarUrl,
        this.location,
        this.random,
        this.desc});

  SameCityItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    photoAddr = json['photoAddr'];
    distance = json['distance'];
    avatarUrl = json['avatarUrl'];
    location = json['location'];
    random = json['random'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['photoAddr'] = this.photoAddr;
    data['distance'] = this.distance;
    data['avatarUrl'] = this.avatarUrl;
    data['location'] = this.location;
    data['random'] = this.random;
    data['desc'] = this.desc;
    return data;
  }
}