import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:west33/Auth/models/userModel.dart';
import 'package:west33/constants.dart';


// write a function to create user using post request
class Userservices {
  // final Future<SharedPreferences> _prefs = await SharedPreferences.getInstance();
  Future<int> createUser(
      String name, String email, String password, String phone) async {
    final response = await http.post(
      Uri.parse('$URL/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        'role': 'User'
      }),
    );
    log(response.statusCode.toString());

    if (response.statusCode == 201 || response.statusCode == 409) {
      return response.statusCode;
    } else {
      throw Exception('Failed to create user.');
    }
  }

  // write a function to login user using post request and save token and _id from response using sharedPreferences

  Future<int> loginUser(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$URL/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      log(response.body);
      if (response.statusCode == 200) {
        log(response.body);
        dynamic jsonResponse = json.decode(response.body)['user'];
        User user = User.fromJson(jsonResponse);

        // final SharedPreferences prefs = await SharedPreferences.getInstance();
        // await prefs.setString('token', user.token);
        // await prefs.setString('id', user.id);
        log('User id: ${user.id}');

        log('User token: ${user.token}');

        return response.statusCode;
      } else if (response.statusCode == 401) {
        throw Exception('Invalid email or password');
      } else {
        throw Exception('Failed to login user.');
      }
    } on SocketException catch (_) {
      throw Exception(
          'No internet connection. Please check your network and try again.');
    } on HttpException catch (_) {
      throw Exception('Could not find the server. Please try again later.');
    } on FormatException catch (_) {
      throw Exception(
          'Bad response format from the server. Please try again later.');
    } on ClientException catch (_) {
      throw Exception(
          'Could not connect to the server. Please ensure the server is running and try again.');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
