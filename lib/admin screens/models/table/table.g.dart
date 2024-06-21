// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Table _$TableFromJson(Map<String, dynamic> json) => Table(
      billStatus: json['billStatus'] as bool,
      capacity: (json['capacity'] as num).toInt(),
      category: json['category'] as String,
      isAvailable: json['isAvailable'] as bool,
      waiterStatus: json['waiterStatus'] as bool,
      tableNumber: (json['tableNumber'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TableToJson(Table instance) => <String, dynamic>{
      'category': instance.category,
      'capacity': instance.capacity,
      'isAvailable': instance.isAvailable,
      'tableNumber': instance.tableNumber,
      'waiterStatus': instance.waiterStatus,
      'billStatus': instance.billStatus,
    };
