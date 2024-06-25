import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:west33/admin%20screens/models/menu.dart';

class ApiService {
  Future<List<MenuItem>> fetchMenuItems({String? category}) async {
    try {
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
        throw const HttpException('Failed to load menu items');
      }
    } catch (e) {
      // GlobalErrorHandler().showError(e.toString());
      print(e.toString());
      rethrow; // Ensure the error is rethrown so it can be caught and handled elsewhere if needed
    }
  }

  Future<List<MenuItem>> postMenuItems(MenuItem menu, File imageFile) async {
    try {
      http.Response response;
      var request = http.MultipartRequest(
          'POST', Uri.parse('http://localhost:3000/api/products'));
      var image = await http.MultipartFile.fromPath('image', imageFile.path);
      request.files.add(image);
      request.fields['name'] = menu.name;
      request.fields['category'] = menu.category;
      request.fields['price'] = menu.price as String;
      request.fields['detail'] = menu.detail;

      response = (await request.send()) as http.Response;

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body)['menu'];
        return jsonResponse.map((item) => MenuItem.fromJson(item)).toList();
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
