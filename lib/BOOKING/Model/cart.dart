import 'package:json_annotation/json_annotation.dart';
import 'package:west33/admin%20screens/models/menu.dart';
// Import the MenuItem model

part 'cart.g.dart';

@JsonSerializable()
class Cart {
  @JsonKey(name: '_id')
  String id;

  @JsonKey(name: 'productId')
  MenuItem product;

  int quantity;

  Cart({required this.id, required this.product, required this.quantity});

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}
