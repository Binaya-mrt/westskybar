import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:west33/BOOKING/Model/table.dart';
import 'dart:convert';

import 'package:west33/constants.dart';

class TableApiService {
  Future<List<TableModel>> fetchAllTable() async {
    try {
      http.Response response = await http.get(Uri.parse('$URL/tables'));

      // log(response.body);

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body)['table'];
        return jsonResponse.map((item) => TableModel.fromJson(item)).toList();
      } else {
        throw HttpException(
            'Failed to load tables with status code ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching tables: $e');
      rethrow; // Ensure the error is rethrown so it can be caught and handled elsewhere if needed
    }
  }
}
