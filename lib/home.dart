import 'package:flutter/material.dart';
import 'package:west33/menu.dart';
import 'package:west33/widgets/menuCard.dart';
import 'package:west33/widgets/sliderAnimation.dart';

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
            navigateToPage(
                context,
                Menu(
                  title: 'Mocktails',
                ));
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
