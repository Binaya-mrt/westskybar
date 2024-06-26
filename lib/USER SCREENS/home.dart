import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:west33/admin%20screens/controller/menuController.dart';
import 'package:west33/USER%20SCREENS/menu.dart';
import 'package:west33/widgets/menuCard.dart';
import 'package:west33/widgets/sliderAnimation.dart';

// THIS IS THE HOME PAGE / THE PAGE THAT WIL FETCH ALL THE PRODUCTS

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final menuController = Provider.of<MenuProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate the number of columns based on screen width
    int crossAxisCount;
    if (screenWidth >= 1200) {
      crossAxisCount = 6;
    } else if (screenWidth >= 900) {
      crossAxisCount = 4;
    } else if (screenWidth >= 600) {
      crossAxisCount = 3;
    } else {
      crossAxisCount = 2;
    }

    return menuController.menuItems == null
        ? const Center(child: Text('No menu available'))
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 6),
            shrinkWrap: true,
            itemCount:
                menuController.menuItems!.length, // total number of items
            itemBuilder: (context, index) {
              var item = menuController.menuItems![index];
              return MenuCard(
                desc: item.detail,
                image: 'assets/images/mocktails.png',
                title: item.name,
                fun: () {
                  navigateToPage(
                      context,
                      Menu(
                        title: 'Mocktails',
                        item: item,
                      ));
                },
              );
            });
  }
}
