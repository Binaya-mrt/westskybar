import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:west33/admin%20screens/models/menu.dart';

part 'order.g.dart';

@JsonSerializable(explicitToJson: true)
class Order {
  @JsonKey(name: '_id')
  String? id;
  final String guest;
  final int total;
  final String table;
  final List<MenuItem> products;
  Order({
    this.id,
    required this.total,
    required this.guest,
    required this.table,
    required this.products,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

//  "guest": "667d061621ba969058c40e24",
//     "products": [
//         "667bfa453361aedb4be9d66a",
//         "667bfa453361aedb4be9d66a"
//     ],
//     "total": 1200,
//     "table": "667d066621ba969058c40e28",
//     "_id": "667d37f79a0082c124f7753b",