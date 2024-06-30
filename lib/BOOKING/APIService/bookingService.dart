import 'dart:convert';
import 'dart:developer';

import 'package:west33/constants.dart';
import 'package:http/http.dart' as http;

Future<bool> checkTableAvailability({
  required String tableId,
  required DateTime date,
  required String arrivalTime,
  required String departureTime,
}) async {
  final response = await http.post(
    Uri.parse('$URL/check-availability'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'tableId': tableId,
      'date': date.toIso8601String(),
      'arrivalTime': arrivalTime,
      'departureTime': departureTime,
    }),
  );

  if (response.statusCode == 200) {
    final result = jsonDecode(response.body);
    return result['isAvailable'];
  } else {
    throw Exception('Failed to check table availability');
  }
}

Future<int> createBooking({
  required String tableId,
  required DateTime date,
  required String arrivalTime,
  required String departureTime,
  required int guestNo,
}) async {
  final response = await http.post(
    Uri.parse('$URL/booking'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'table': tableId,
      'date': date.toIso8601String(),
      'arrivalTime': arrivalTime,
      'departureTime': departureTime,
      'guest': "6670076683c7c627b97a1a51",
      "guestNo": guestNo.toString(),
    }),
  );

  if (response.statusCode == 201) {
    // final result = jsonDecode(response.body);
    return response.statusCode;
  } else {
    throw Exception('Error Booking the Table');
  }
}
