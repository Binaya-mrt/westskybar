// /cart/

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:west33/BOOKING/Model/cart.dart';
import 'package:west33/constants.dart';
import 'package:http/http.dart' as http;

class CartService {
  Future<int> sendCartData(
      String userId, List<Map<String, dynamic>> products) async {
    final url = '$URL/cart/$userId';
    final headers = {"Content-Type": "application/json"};

    final body = jsonEncode({
      "products": products,
    });

    try {
      final response = await http.patch(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return response.statusCode;
      } else {
        print("Failed to send cart data: ${response.statusCode}");
        return response.statusCode;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Cart>> fetchCart({required String userId}) async {
    try {
      http.Response response = await http.get(Uri.parse('$URL/cart/$userId'));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);

        // Extracting products from the response
        List<Cart> cartItems = [];
        for (var item in jsonResponse) {
          for (var product in item['products']) {
            cartItems.add(Cart.fromJson(product));
          }
        }

        return cartItems;
      } else {
        throw HttpException(
            'Failed to load cart with status code ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching cart: $e');
      rethrow; // Ensure the error is rethrown so it can be caught and handled elsewhere if needed
    }
  }
}
