// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['_id'] as String?,
      total: (json['total'] as num).toInt(),
      guest: json['guest'] as String,
      table: json['table'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => MenuItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      '_id': instance.id,
      'guest': instance.guest,
      'total': instance.total,
      'table': instance.table,
      'products': instance.products.map((e) => e.toJson()).toList(),
    };
