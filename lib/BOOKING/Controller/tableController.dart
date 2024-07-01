import 'package:west33/BOOKING/APIService/tableService.dart';

import 'package:flutter/material.dart';
import 'package:west33/BOOKING/Model/table.dart';

class TableProvider extends ChangeNotifier {
  List<TableModel>? _allTables;

  List<TableModel>? get allTables => _allTables;

  Future<void> fetchAllTables() async {
    try {
      final apiService = TableApiService();
      _allTables = await apiService.fetchAllTable();

      notifyListeners();
    } catch (error) {
      // print(error);
    }
  }
}
