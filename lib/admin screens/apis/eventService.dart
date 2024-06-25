import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:west33/admin%20screens/models/event.dart';

class EventApiService {
  Future<List<Event>> fetchAllEvents({String? category}) async {
    try {
      http.Response response;

      // if (category != null) {
      //   response = await http.get(Uri.parse(
      //       'http://localhost:3000/api/Availableproducts/?category=$category'));
      // } else {
      response = await http.get(Uri.parse('http://localhost:3000/api/events'));
      // }
      print("THis is called ${response.body}");

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body)['events'];

        return jsonResponse.map((item) => Event.fromJson(item)).toList();
      } else {
        throw const HttpException('Failed to load menu items');
      }
    } catch (e) {
      // GlobalErrorHandler().showError(e.toString());
      print(e);
      rethrow;
      // rethrow; // Ensure the error is rethrown so it can be caught and handled elsewhere if needed
    }
  }
}
