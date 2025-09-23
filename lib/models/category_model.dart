import 'dart:convert';

class Category {
  final String id;
  final String name;
  final String image;
  final String banner;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.banner,
  });
  Map<String,dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'banner': banner,
    };
  }
  // Factory method to create a Category from a Map
  factory Category.fromMap(Map<String, dynamic> map,) {
    return Category(
      id: map['_id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      banner: map['banner'] as String,
    );
  }

 String toJson() => json.encode(toMap());


  // ✅ Create a Category from a JSON string
  factory Category.fromJson(String source,) =>
      Category.fromMap(json.decode(source),);
}
