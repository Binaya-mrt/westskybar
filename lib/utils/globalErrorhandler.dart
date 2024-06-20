import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io'; // For SocketException and HttpException
import 'package:http/http.dart' as http; // For ClientException

class GlobalErrorHandler {
  static final GlobalErrorHandler _instance = GlobalErrorHandler._internal();
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  factory GlobalErrorHandler() {
    return _instance;
  }

  GlobalErrorHandler._internal();

  void init() {
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);
      showError(details.exceptionAsString());
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      showError(error.toString());
      return true;
    };
  }

  
  void showError(dynamic error) {
    // Log the error type and message
    print('Error Type: ${error.runtimeType}');
    print('Error Message: $error');

    final context = scaffoldMessengerKey.currentContext;
    if (context != null) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(getFriendlyErrorMessage(error)),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  String getFriendlyErrorMessage(dynamic error) {
    print("hello");
    print(error);
    if (error is http.ClientException) {
      return "Network error. Please check your internet connection.";
    } else if (error is TimeoutException) {
      return "The connection has timed out. Please try again later.";
    } else if (error is SocketException) {
      return "Unable to connect to the server. Please check your network.";
    } else if (error is HttpException) {
      return "Server error. Please try again later.";
    } else if (error is FormatException) {
      return "Unexpected response format. Please try again later.";
    } else {
      return "An unexpected error occurred. Please try again.";
    }
  }
}
