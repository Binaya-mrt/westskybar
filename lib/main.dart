import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff8D7B4B),
        textTheme: TextTheme(
          titleLarge: TextStyle(
              color: Color(0xff8D7B4B),
              fontSize: 12,
              fontWeight: FontWeight.w500),
          titleMedium: TextStyle(
              color: Color(0xff8D7B4B),
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset('assets/images/logo.png'),
        centerTitle: true,
        leading:  Image.asset('assets/images/More.png'),,
      ),
    );
  }
}
