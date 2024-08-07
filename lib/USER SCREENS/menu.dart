import 'package:flutter/material.dart';
import 'package:west33/admin%20screens/models/menu.dart';
import 'package:west33/appbar.dart';
import 'package:west33/constants.dart';
import 'package:west33/widgets/floatingButton.dart';
import 'package:west33/USER%20SCREENS/itempage.dart';
import 'package:west33/widgets/customDrawer.dart';
import 'package:west33/widgets/menuCard.dart';
import 'package:west33/widgets/sliderAnimation.dart';

class Menu extends StatelessWidget {
  Menu({super.key, required this.title, required this.item});
  final String title;
  final MenuItem item;

  final GlobalKey<ScaffoldState> key2 = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: MyAppBar(okay: key2),
      drawer: const CustomDrawer(),
      floatingActionButton: CustomFloatingActionButtons(
        waiterIconPath: 'assets/images/fab.png',
        helpIconPath: Icons.help_outline
            .toString(), // Assuming you want to use an icon instead of an asset
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff474343).withOpacity(0.47)),
                child: TextFormField(
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10, bottom: 10),
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Color(0xff8F8484))),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_back_ios,
                      size: 14,
                      color: Colors.white,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              // TODO: GET product according to category
              GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3 / 6),
                shrinkWrap: true,
                children: [
                  MenuCard(
                    desc: item.detail,
                    image: '$ImageURL${item.image}',
                    title: item.name,
                    fun: () {
                      navigateToPage(
                          context,
                          ItemPage(
                            item: item,
                          ));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
