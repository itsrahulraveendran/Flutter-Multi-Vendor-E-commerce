import 'dart:convert';

class BannerModel {
  final String id;
  final String image;

  BannerModel({required this.id, required this.image});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'image': image};
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(id: map['id'], image: map['image'] as String);
  }
  String toJson()=> json.encode(toMap());
  
  factory BannerModel.fromJson(String source )=> BannerModel.fromMap(json.decode(source));
  
}
