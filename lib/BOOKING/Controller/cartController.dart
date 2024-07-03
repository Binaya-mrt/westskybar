import 'package:west33/BOOKING/APIService/cartService.dart';
import 'package:west33/BOOKING/APIService/tableService.dart';

import 'package:flutter/material.dart';
import 'package:west33/BOOKING/Model/cart.dart';

class CartProvider extends ChangeNotifier {
  List<Cart>? _allCart;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Cart>? get allCarts => _allCart;

  Future<void> fetchCart(String userId) async {
    _isLoading = true;
    notifyListeners();
    try {
      final apiService = CartService();
      _allCart = await apiService.fetchCart(userId: userId);

      notifyListeners();
    } catch (error) {
      _allCart = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
