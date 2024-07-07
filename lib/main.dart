import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:west33/Auth/presentation/screens/profileScreen.dart';
import 'package:west33/BOOKING/Controller/cartController.dart';
import 'package:west33/BOOKING/Controller/tableController.dart';
import 'package:west33/admin%20screens/controller/eventController.dart';
import 'package:west33/admin%20screens/controller/menuController.dart';

import 'package:west33/admin%20screens/controller/orderController.dart';

class MyHttpoverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpoverrides();
  // GlobalErrorHandler().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MenuProvider()),
        ChangeNotifierProvider(create: (context) => EventProvider()),
        ChangeNotifierProvider(create: (context) => TableProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
      ],
      child: MaterialApp(
        // scaffoldMessengerKey: GlobalErrorHandler.scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          primaryColor: const Color(0xff8D7B4B),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
                color: Color(0xff8D7B4B),
                fontSize: 12,
                fontWeight: FontWeight.w700),
            titleMedium: TextStyle(
                color: Color(0xff8D7B4B),
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
        ),
        home: const ProfileScreen(),
      ),
    );
  }
}
