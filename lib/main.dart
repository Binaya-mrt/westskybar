import 'package:flutter/material.dart';
import 'package:west33/homePage.dart';
import 'package:west33/menu.dart';
import 'package:west33/widgets/menuCard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const HomePage(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 6),
      shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      children: [
        MenuCard(
          desc: 'Elyx Vodka, Ginger, Mint, Lemon & Fever-Tree Soda',
          image: 'assets/images/mocktails.png',
          title: 'Mocktails',
          fun: () {
            print('Hello 1');
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Menu(
                title: 'Mocktails',
              );
            }));
          },
        ),
        MenuCard(
          desc: 'Elyx Vodka, Ginger, Mint, Lemon & Fever-Tree Soda',
          image: 'assets/images/gin.png',
          title: 'gin',
          fun: () {},
        ),
        MenuCard(
          desc: 'Elyx Vodka, Ginger, Mint, Lemon & Fever-Tree Soda',
          image: 'assets/images/wine.png',
          title: 'Wine',
          fun: () {},
        ),
        MenuCard(
          desc: 'Elyx Vodka, Ginger, Mint, Lemon & Fever-Tree Soda',
          image: 'assets/images/mocktails.png',
          title: 'Mocktails',
          fun: () {},
        ),
      ],
    );
  }
}
