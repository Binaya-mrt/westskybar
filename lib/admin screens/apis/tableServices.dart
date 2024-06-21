import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:west33/admin%20screens/models/table/table.dart';

class ApiService {
  Future<List<Table>> fetchTable({String? category}) async {
    try {
      http.Response response;

      response = await http.get(Uri.parse(
          'http://localhost:3000/api/Availableproducts/?category=$category'));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body)['menu'];
        return jsonResponse.map((item) => Table.fromJson(item)).toList();
      } else {
        throw const HttpException('Failed to load menu items');
      }
    } catch (e) {
      // GlobalErrorHandler().showError(e.toString());
      print(e.toString());
      rethrow; // Ensure the error is rethrown so it can be caught and handled elsewhere if needed
    }
  }
}
