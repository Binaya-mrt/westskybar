import 'package:west33/BOOKING/APIService/cartService.dart';
import 'package:west33/BOOKING/APIService/tableService.dart';

import 'package:flutter/material.dart';
import 'package:west33/BOOKING/Model/cart.dart';

class CartProvider extends ChangeNotifier {
  List<Cart>? _allCart;

  List<Cart>? get allCatrts => _allCart;

  Future<void> fetchCart(String userId) async {
    try {
      final apiService = CartService();
      _allCart = await apiService.fetchCart(userId: userId);

      notifyListeners();
    } catch (error) {
      // print(error);
    }
  }
}
