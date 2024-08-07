import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:west33/admin%20screens/apis/menuService.dart';
import 'package:west33/admin%20screens/models/menu.dart';
import 'package:west33/utils/globalErrorhandler.dart';

class MenuProvider extends ChangeNotifier {
  List<MenuItem>? _menuItems;

  List<MenuItem>? get menuItems => _menuItems;
  List<MenuItem>? _allmenuItems;

  List<MenuItem>? get allmenuItems => _allmenuItems;
  int? response;

  Future<void> fetchMenuItems(context, {String? category}) async {
    try {
      log('Fetching menu of category: $category');
      final apiResult = await ApiService().fetchMenuItems(category: category);

      apiResult.fold(
        (failure) {
          showErrorDialog(context, failure);
        },
        (success) {
          _menuItems = success;
          notifyListeners();
        },
      );
    } catch (error) {
      // print(error);
    }
  }

  Future<void> fetchAllMenuItems() async {
    try {
      final apiService = ApiService();

      _allmenuItems = await apiService.fetchAllMenuItems();
      // print(_allmenuItems);

      notifyListeners();
    } catch (error) {
      // print(error);
    }
  }

  Future<void> postMenuItems(MenuItem menu, File image) async {
    try {
      final apiService = ApiService();

      _menuItems = await apiService.postMenuItems(menu, image);

      notifyListeners();
    } catch (error) {
      // print(error);
    }
  }

  Future<void> updateMenuItems(MenuItem menu, String id) async {
    try {
      final apiService = ApiService();

      await apiService.updateMenuItems(id, menu);

      notifyListeners();
    } catch (error) {
      // print(error);
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
      // print(error);
    }
    return null;
  }
}
