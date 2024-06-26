import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:west33/USER%20SCREENS/menu.dart';
import 'package:west33/admin%20screens/apis/menuService.dart';
import 'package:west33/admin%20screens/models/menu.dart';

class MenuProvider extends ChangeNotifier {
  List<MenuItem>? _menuItems;

  List<MenuItem>? get menuItems => _menuItems;
  List<MenuItem>? _allmenuItems;

  List<MenuItem>? get allmenuItems => _allmenuItems;
  int? response;

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

  Future<void> fetchAllMenuItems() async {
    try {
      final apiService = ApiService();

      _allmenuItems = await apiService.fetchAllMenuItems();
      print(_allmenuItems);

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> postMenuItems(MenuItem menu, File image) async {
    try {
      final apiService = ApiService();

      _menuItems = await apiService.postMenuItems(menu, image);

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> updateMenuItems(MenuItem menu, String id) async {
    try {
      final apiService = ApiService();

      await apiService.updateMenuItems(id, menu);

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<int?> deleteMenuItems(String id) async {
    try {
      final apiService = ApiService();

      int status = await apiService.deleteMenuItems(
        id,
      );
      notifyListeners();
      return status;
    } catch (error) {
      print(error);
    }
    return null;
  }
}
