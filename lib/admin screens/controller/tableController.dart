import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:west33/admin%20screens/apis/eventService.dart';

import 'package:west33/admin%20screens/models/event.dart';

import 'package:flutter/material.dart';

class EventProvider extends ChangeNotifier {
  List<Event>? _allTables;

  List<Event>? get allTables => _allTables;

  Future<void> fetchAllTables({String? category}) async {
    log("THis is called ");
    try {
      final apiService = EventApiService();
      _allTables = await apiService.fetchAllEvents(category: category);

      // Clear existing lists

      // Classify events

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
