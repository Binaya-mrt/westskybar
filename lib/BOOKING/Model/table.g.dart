// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Table _$TableFromJson(Map<String, dynamic> json) => Table(
      id: json['_id'] as String?,
      tableNo: (json['tableNo'] as num).toInt(),
      capacity: (json['capacity'] as num).toInt(),
      category: json['category'] as String,
      waiterStatus: json['waiterStatus'] as bool,
      billStatus: json['billStatus'] as bool,
      isAvailable: json['isAvailable'] as bool,
    );

Map<String, dynamic> _$TableToJson(Table instance) => <String, dynamic>{
      '_id': instance.id,
      'tableNo': instance.tableNo,
      'category': instance.category,
      'capacity': instance.capacity,
      'waiterStatus': instance.waiterStatus,
      'billStatus': instance.billStatus,
      'isAvailable': instance.isAvailable,
    };
