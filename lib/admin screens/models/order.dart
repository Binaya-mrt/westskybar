import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderResponse {
  final bool success;
  final List<TableOrder> order;

  OrderResponse({
    required this.success,
    required this.order,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TableOrder {
  final TableDetails table;
  final List<OrderDetails> orders;

  TableOrder({
    required this.table,
    required this.orders,
  });

  factory TableOrder.fromJson(Map<String, dynamic> json) =>
      _$TableOrderFromJson(json);
  Map<String, dynamic> toJson() => _$TableOrderToJson(this);
}

@JsonSerializable()
class TableDetails {
  @JsonKey(name: '_id')
  final String id;
  final String category;
  final int tableNo;
  final bool waiterStatus;
  final bool billStatus;

  TableDetails({
    required this.id,
    required this.category,
    required this.tableNo,
    required this.waiterStatus,
    required this.billStatus,
  });

  factory TableDetails.fromJson(Map<String, dynamic> json) =>
      _$TableDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$TableDetailsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OrderDetails {
  @JsonKey(name: '_id')
  final String id;
  final String guest;
  final List<ProductDetails> products;

  OrderDetails({
    required this.id,
    required this.guest,
    required this.products,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailsToJson(this);
}

@JsonSerializable()
class ProductDetails {
  final String productId;
  final String productName;
  final int price;
  final int quantity;

  ProductDetails({
    required this.productId,
    required this.productName,
    required this.price,
    required this.quantity,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDetailsToJson(this);
}
