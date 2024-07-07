import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:west33/admin%20screens/models/order.dart';
import 'package:west33/constants.dart';

class Orderservice {
  Future<OrderResponse> fetchOrders() async {
    final response = await http.get(Uri.parse('$URL/order'));

    if (response.statusCode == 200) {
      return OrderResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load orders');
    }
  }
}
