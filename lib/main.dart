import 'package:flutter/material.dart';
import 'package:west33/appbar.dart';
import 'package:west33/floatingButton.dart';

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
                      Center(child: Text("Transit Tab Content")),
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

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.black),
            child: Center(child: Image.asset('assets/images/logo.png')),
          ),
          ListTile(
            title: const Text(
              'Menu',
              style: TextStyle(
                  color: Color(0xffBDB1B1),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(
            color: Color(0xffBDB1B1),
          ),
          ListTile(
            title: const Text(
              'Book a table',
              style: TextStyle(
                  color: Color(0xffBDB1B1),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(
            color: Color(0xffBDB1B1),
          ),
          ListTile(
            title: const Text(
              'Cart',
              style: TextStyle(
                  color: Color(0xffBDB1B1),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(
            color: Color(0xffBDB1B1),
          ),
          ListTile(
            title: const Text(
              'Ask for the bill',
              style: TextStyle(
                  color: Color(0xffBDB1B1),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(
            color: Color(0xffBDB1B1),
          ),
          ListTile(
            title: const Text(
              'Profile',
              style: TextStyle(
                  color: Color(0xffBDB1B1),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(
            color: Color(0xffBDB1B1),
          ),
        ],
      ),
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
          fun: () {},
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

class Menu extends StatelessWidget {
  Menu({super.key, required this.title});
  final String title;

  final GlobalKey<ScaffoldState> key2 = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
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
                height: 14,
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Hero(
                  tag: title,
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
              ),
              const SizedBox(
                height: 14,
              ),
              GridView(
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Menu(
                          title: title,
                        );
                      }));
                    },
                  ),
                  MenuCard(
                    desc: 'Elyx Vodka, Ginger, Mint, Lemon & Fever-Tree Soda',
                    image: 'assets/images/gin.png',
                    title: 'gin',
                    fun: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Menu(
                          title: title,
                        );
                      }));
                    },
                  ),
                  MenuCard(
                    desc: 'Elyx Vodka, Ginger, Mint, Lemon & Fever-Tree Soda',
                    image: 'assets/images/wine.png',
                    title: 'Wine',
                    fun: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Menu(
                          title: title,
                        );
                      }));
                    },
                  ),
                  MenuCard(
                    desc: 'Elyx Vodka, Ginger, Mint, Lemon & Fever-Tree Soda',
                    image: 'assets/images/mocktails.png',
                    title: 'Mocktails',
                    fun: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Menu(
                          title: title,
                        );
                      }));
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

class MenuCard extends StatelessWidget {
  MenuCard({
    super.key,
    required this.desc,
    required this.image,
    required this.title,
    required this.fun,
  });
  final String image;
  final String title;
  final String desc;
  VoidCallback fun;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: title,
      child: GestureDetector(
        onTap: () {
          fun;
        },
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset('assets/images/Arrow.png'),
              const SizedBox(
                height: 8,
              ),
              Text(
                title.toUpperCase(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                desc,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
