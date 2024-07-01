
import 'package:json_annotation/json_annotation.dart';

part 'menu.g.dart';

@JsonSerializable()
class MenuItem {
  @JsonKey(name: '_id')
  String? id;
  final String name;
  final String category;
  final int price;
  final String detail;
  String? image;
  bool isAvailable;

  MenuItem({
    this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.detail,
    this.image,
    required this.isAvailable,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) =>
      _$MenuItemFromJson(json);

  Map<String, dynamic> toJson() => _$MenuItemToJson(this);
}
