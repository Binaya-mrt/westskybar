import 'package:flutter/foundation.dart';
import 'package:west33/admin%20screens/apis/menuService.dart';
import 'package:west33/admin%20screens/models/menuModel.dart';

class MenuProvider extends ChangeNotifier {
  List<MenuItem>? _menuItems;

  List<MenuItem>? get menuItems => _menuItems;

  Future<void> fetchMenuItems({String? category}) async {
    try {
      final apiService = ApiService();

      if (category != null) {
        _menuItems = await apiService.fetchMenuItems(category: category);
      } else {
        _menuItems = await apiService.fetchMenuItems();
      }
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
