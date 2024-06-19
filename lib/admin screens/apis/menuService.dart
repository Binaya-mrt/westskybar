import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:west33/admin%20screens/models/menuModel.dart';

class ApiService {
  Future<List<MenuItem>> fetchMenuItems({String? category}) async {
    http.Response response;
    if (category != null) {
      response = await http.get(Uri.parse(
          'http://localhost:3000/api/Availableproducts/?category=$category'));
    } else {
      response = await http
          .get(Uri.parse('http://localhost:3000/api/Availableproducts'));
    }

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body)['menu'];
      return jsonResponse.map((item) => MenuItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load menu items');
    }
  }
}


