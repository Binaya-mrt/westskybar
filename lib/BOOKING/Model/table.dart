import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'table.g.dart';

@JsonSerializable()
class Table {
  @JsonKey(name: '_id')
  String? id;
  final int tableNo;
  final String category;
  final int capacity;
  final bool waiterStatus;
  final bool billStatus;
  bool isAvailable;
  Table({
    this.id,
    required this.tableNo,
    required this.capacity,
    required this.category,
    required this.waiterStatus,
    required this.billStatus,
    required this.isAvailable,
  });

  factory Table.fromJson(Map<String, dynamic> json) => _$TableFromJson(json);

  Map<String, dynamic> toJson() => _$TableToJson(this);
}
