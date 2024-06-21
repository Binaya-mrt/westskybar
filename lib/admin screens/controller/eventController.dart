import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:west33/admin%20screens/apis/eventService.dart';
import 'package:west33/admin%20screens/apis/menuService.dart';
import 'package:west33/admin%20screens/models/event.dart';
import 'package:west33/admin%20screens/models/menuModel.dart';

class EventProvider extends ChangeNotifier {
  List<Event>? _allevents;

  List<Event>? get allEvents => _allevents;

  Future<void> fetchAllEvents() async {
    log("THis is called ");
    try {
      final apiService = EventApiService();

      // if (category != null) {
      //   _allevents = await apiService.fetchAllEvents(category: category);
      // } else {
      _allevents = await apiService.fetchAllEvents();
      log(_allevents!.toString());
      // }
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
