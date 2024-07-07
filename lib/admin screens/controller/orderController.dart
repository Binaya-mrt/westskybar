
import 'package:flutter/material.dart';
import 'package:west33/admin%20screens/apis/orderService.dart';
import 'package:west33/admin%20screens/models/order.dart';


class OrderProvider with ChangeNotifier {
  List<TableOrder> _orders = [];
  bool _isLoading = false;

  List<TableOrder> get orders => _orders;
  bool get isLoading => _isLoading;

  final Orderservice _apiService = Orderservice();

  Future<void> fetchOrders() async {
    _isLoading = true;
    notifyListeners();

    try {
      OrderResponse response = await _apiService.fetchOrders();
      _orders = response.order;
      print("*********_______----------");
      print(_orders);
      print("*********_______----------");
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
