
import 'package:json_annotation/json_annotation.dart';

part 'table.g.dart';

@JsonSerializable()
class TableModel {
  @JsonKey(name: '_id')
  String? id;
  final int tableNo;
  final String category;
  final int capacity;
  final bool waiterStatus;
  final bool billStatus;
  bool isAvailable;
  TableModel({
    this.id,
    required this.tableNo,
    required this.capacity,
    required this.category,
    required this.waiterStatus,
    required this.billStatus,
    required this.isAvailable,
  });

  factory TableModel.fromJson(Map<String, dynamic> json) =>
      _$TableModelFromJson(json);

  Map<String, dynamic> toJson() => _$TableModelToJson(this);
}
