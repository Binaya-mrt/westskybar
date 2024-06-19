import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:west33/admin%20screens/controller/menuController.dart';
import 'package:west33/appbar.dart';
import 'package:west33/floatingButton.dart';
import 'package:west33/main.dart';
import 'package:west33/menu.dart';
import 'package:west33/widgets/customDrawer.dart';
import 'package:west33/widgets/menuCard.dart';
import 'package:west33/widgets/sliderAnimation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          key: _key,
          appBar: MyAppBar(okay: _key),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
            child: Column(
              children: [
                Container(
                  height: 40,
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xff474343).withOpacity(0.47)),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Color(0xff8F8484))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 34,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      tabAlignment: TabAlignment.start,
                      padding: const EdgeInsets.all(0),
                      dividerColor: Colors.black,
                      isScrollable: true,
                      labelColor: Colors.white,
                      unselectedLabelColor: const Color(0xff8D7474),
                      labelStyle: const TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w500),
                      indicator: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: const Color(0xffE46615).withOpacity(
                            0.82), // Background color for active tab
                        borderRadius: BorderRadius.circular(19),
                        border: Border.all(
                            color: const Color(0xffC1B9B9), width: 1),
                      ),
                      tabs: const [
                        SizedBox(
                          height: 32,
                          width: 86,
                          child: Tab(text: "All"),
                        ),
                        SizedBox(
                          height: 32,
                          width: 86,
                          child: Tab(text: "Drinks"),
                        ),
                        SizedBox(
                          height: 32,
                          width: 86,
                          child: Tab(text: "Snacks"),
                        ),
                        SizedBox(
                          height: 32,
                          width: 86,
                          child: Tab(text: "Foods"),
                        ),
                        SizedBox(
                          height: 32,
                          width: 86,
                          child: Tab(text: "Sittan"),
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Home(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Drinks(),
                      ),
                      Center(child: Text("Bike Tab Content")),
                      Center(child: Text("Transit Tab Content")),
                      Center(child: Text("Bike Tab Content"))
                    ],
                  ),
                ),
              ],
            ),
          )),
          drawer: const CustomDrawer(),
          floatingActionButton: CustomFloatingActionButtons(
            waiterIconPath: 'assets/images/fab.png',
            helpIconPath: Icons.help_outline
                .toString(), // Assuming you want to use an icon instead of an asset
          )),
    );
  }
}

class Drinks extends StatelessWidget {
  const Drinks({super.key});

  @override
  Widget build(BuildContext context) {
    const URL = "http://localhost:3000";
    final menuController = Provider.of<MenuProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    menuController.fetchMenuItems(category: 'drinks');

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
        ? Center(child: Text('No menu available'))
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
                image: URL + item.image,
                title: item.name,
                fun: () {
                  navigateToPage(
                      context,
                      Menu(
                        title: 'Mocktails',
                      ));
                },
              );
            });
  }
}
