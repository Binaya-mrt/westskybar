import 'package:json_annotation/json_annotation.dart';

part 'table.g.dart';

@JsonSerializable()
class Table {
  final String category;
  final int capacity;
  final bool isAvailable;
  final int? tableNumber;
  final bool waiterStatus;
  final bool billStatus;

  const Table(
      {required this.billStatus,
      required this.capacity,
      required this.category,
      required this.isAvailable,
      required this.waiterStatus,
      this.tableNumber});

  factory Table.fromJson(Map<String, dynamic> json) => _$TableFromJson(json);

  Map<String, dynamic> toJson() => _$TableToJson(this);
}














//  "category": "Indoor",
//             "capacity": 10,
//             "isAvailable": false,
//             "tableNo": 3,
//             "waiterStatus": false,
//             "billStatus": false,