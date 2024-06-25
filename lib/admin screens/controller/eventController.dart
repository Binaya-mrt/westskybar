import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:west33/admin%20screens/apis/eventService.dart';

import 'package:west33/admin%20screens/models/event.dart';

import 'package:flutter/material.dart';

class EventProvider extends ChangeNotifier {
  List<Event>? _allEvents;
  List<Event>? _upcomingEvents;
  List<Event>? _previousEvents;

  List<Event>? get allEvents => _allEvents;
  List<Event>? get upcomingEvents => _upcomingEvents;
  List<Event>? get previousEvents => _previousEvents;

  Future<void> fetchAllEvents() async {
    log("THis is called ");
    try {
      final apiService = EventApiService();
      _allEvents = await apiService.fetchAllEvents();
      log(_allEvents!.toString());

      // Clear existing lists
      _upcomingEvents = [];
      _previousEvents = [];

      // Classify events
      final currentDate = DateTime.now();
      for (var event in _allEvents!) {
        if (event.date.isAfter(currentDate)) {
          _upcomingEvents!.add(event);
        } else {
          _previousEvents!.add(event);
        }
      }

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
