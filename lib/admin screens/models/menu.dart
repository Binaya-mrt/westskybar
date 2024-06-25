import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'menu.g.dart';

@JsonSerializable()
class MenuItem {
  String? id;
  final String name;
  final String category;
  final int price;
  final String detail;
  String? image;
  // File? imageFile;
  bool? isAvailable;

  MenuItem({
    this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.detail,
    // this.imageFile,
    this.image,
    this.isAvailable,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) =>
      _$MenuItemFromJson(json);

  Map<String, dynamic> toJson() => _$MenuItemToJson(this);

  // factory MenuItem.fromJson(Map<String, dynamic> json) {
  //   return MenuItem(
  //     id: json['_id'],
  //     name: json['name'],
  //     category: json['category'],
  //     price: json['price'],
  //     detail: json['detail'],
  //     image: json['image'],
  //     isAvailable: json['isAvailable'],
  //   );
  // }
}
