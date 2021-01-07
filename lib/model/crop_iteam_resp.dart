class CropIteamResp {
  String id;
  String commodityName;
  String photo;

  CropIteamResp({this.id, this.commodityName, this.photo});

  CropIteamResp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    commodityName = json['commodityName'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['commodityName'] = this.commodityName;
    data['photo'] = this.photo;
    return data;
  }
}