// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) =>
    OrderResponse(
      success: json['success'] as bool,
      order: (json['order'] as List<dynamic>)
          .map((e) => TableOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'order': instance.order.map((e) => e.toJson()).toList(),
    };

TableOrder _$TableOrderFromJson(Map<String, dynamic> json) => TableOrder(
      table: TableDetails.fromJson(json['table'] as Map<String, dynamic>),
      orders: (json['orders'] as List<dynamic>)
          .map((e) => OrderDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TableOrderToJson(TableOrder instance) =>
    <String, dynamic>{
      'table': instance.table.toJson(),
      'orders': instance.orders.map((e) => e.toJson()).toList(),
    };

TableDetails _$TableDetailsFromJson(Map<String, dynamic> json) => TableDetails(
      id: json['_id'] as String,
      category: json['category'] as String,
      tableNo: (json['tableNo'] as num).toInt(),
      waiterStatus: json['waiterStatus'] as bool,
      billStatus: json['billStatus'] as bool,
    );

Map<String, dynamic> _$TableDetailsToJson(TableDetails instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'category': instance.category,
      'tableNo': instance.tableNo,
      'waiterStatus': instance.waiterStatus,
      'billStatus': instance.billStatus,
    };

OrderDetails _$OrderDetailsFromJson(Map<String, dynamic> json) => OrderDetails(
      id: json['_id'] as String,
      guest: json['guest'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderDetailsToJson(OrderDetails instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'guest': instance.guest,
      'products': instance.products.map((e) => e.toJson()).toList(),
    };

ProductDetails _$ProductDetailsFromJson(Map<String, dynamic> json) =>
    ProductDetails(
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      price: (json['price'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$ProductDetailsToJson(ProductDetails instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'price': instance.price,
      'quantity': instance.quantity,
    };
