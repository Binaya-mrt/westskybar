import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:west33/admin%20screens/models/menu.dart';
import 'package:west33/constants.dart';

class ApiService {
  Future<Either<String, List<MenuItem>>> fetchMenuItems(
      {String? category}) async {
    try {
      http.Response response;

      if (category != null) {
        response = await http.get(Uri.parse(
            // 'http://localhost:3000/api/Availableproducts/?category=$category'));
            '$URL/Availableproducts/?category=$category'));
      } else {
        response = await http.get(Uri.parse('$URL/Availableproducts'));
      }
      // log(response.toString());

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body)['menu'];
        return Right(
            jsonResponse.map((item) => MenuItem.fromJson(item)).toList());
      } else {
        return Left('Failed to load menu items due to HTTP error');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<List<MenuItem>> fetchAllMenuItems() async {
    try {
      http.Response response;

      response = await http.get(Uri.parse(
          // 'http://localhost:3000/api/Availableproducts/?category=$category'));
          '$URL/products'));

      log(response.body);

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

  Future<MenuItem> updateMenuItems(String id, MenuItem menu) async {
    try {
      http.Response response;

      response = await http.put(Uri.parse(
          // 'http://localhost:3000/api/Availableproducts/?category=$category'));
          '$URL/Availableproducts/$id'));

      // log(response.toString());

      if (response.statusCode == 200) {
        dynamic jsonResponse = json.decode(response.body)['updatedMenu'];
        return MenuItem.fromJson(jsonResponse);
      } else {
        throw const HttpException('Failed to load menu items');
      }
    } catch (e) {
      // GlobalErrorHandler().showError(e.toString());

      rethrow; // Ensure the error is rethrown so it can be caught and handled elsewhere if needed
    }
  }

  Future<int> deleteMenuItems(
    String id,
  ) async {
    try {
      http.Response response;

      response = await http.delete(Uri.parse(
          // 'http://localhost:3000/api/Availableproducts/?category=$category'));
          '$URL/products/$id'));

      log(response.body);

      if (response.statusCode == 200) {
        return response.statusCode;
      } else {
        throw const HttpException('Failed to load menu items');
      }
    } catch (e) {
      // GlobalErrorHandler().showError(e.toString());

      rethrow; // Ensure the error is rethrown so it can be caught and handled elsewhere if needed
    }
  }

  Future<List<MenuItem>> postMenuItems(MenuItem menu, File imageFile) async {
    log("postMenuItems called with image: ${imageFile.path}");

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$URL/products'),
      );

      log('Created MultipartRequest: $request');

      // Add image file to the request
      var image = await http.MultipartFile.fromPath('image', imageFile.path);
      request.files.add(image);

      // Add other form fields
      request.fields['name'] = menu.name;
      request.fields['category'] = menu.category;
      request.fields['price'] = menu.price.toString();
      request.fields['detail'] = menu.detail;

      log('Request fields and files added.');

      // Send the request
      var response = await request.send();

      log('Response received: ${response.statusCode}');

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        log('Response data: $responseData');

        List<dynamic> jsonResponse = json.decode(responseData)['menu'];
        return jsonResponse.map((item) => MenuItem.fromJson(item)).toList();
      } else {
        var responseData = await response.stream.bytesToString();
        log('Failed to load menu items: ${responseData}');
        throw HttpException(
            'Failed to load menu items. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error occurred: ${e.toString()}');
      rethrow;
    }
  }
}
