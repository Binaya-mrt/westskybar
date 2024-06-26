import 'package:flutter/material.dart';
import 'package:west33/admin%20screens/ADMINVIEWS/admin_home.dart';
import 'package:west33/BOOKING/bookingDetail.dart';
import 'package:west33/EVENTS%20AND%20GALLERY/events.dart';
import 'package:west33/EVENTS%20AND%20GALLERY/gallery.dart';
import 'package:west33/USER%20SCREENS/homePage.dart';
import 'package:west33/waiter%20Screens/waiter_home.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _drawerAnimation;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<String> _menuItems = [
    'MENU',
    'BOOK A TABLE',
    'GALLERY',
    'EVENTS',
    'WAITER',
    'ADMIN'
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _drawerAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
      _addMenuItems();
    });
  }

  void _addMenuItems() async {
    for (int i = 0; i < _menuItems.length; i++) {
      await Future.delayed(const Duration(milliseconds: 200));
      _listKey.currentState?.insertItem(i);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _drawerAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
              -MediaQuery.of(context).size.width * (1 - _drawerAnimation.value),
              0),
          child: Drawer(
            backgroundColor: Colors.black,
            child: Column(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(color: Colors.black),
                  child: Center(child: Image.asset('assets/images/logo.png')),
                ),
                Expanded(
                  child: AnimatedList(
                    key: _listKey,
                    initialItemCount: 0,
                    itemBuilder: (context, index, animation) {
                      return _buildItem(_menuItems[index], animation, context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildItem(
      String item, Animation<double> animation, BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: Column(
        children: [
          ListTile(
            title: Text(
              item,
              style: const TextStyle(
                color: Color(0xff8D7B4B),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              // Define the navigation based on the item
              if (item == 'MENU') {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (Route route) => route.isFirst,
                );
              } else if (item == 'BOOK A TABLE') {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const Book()),
                  (Route route) => route.isFirst,
                );
              } else if (item == 'GALLERY') {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Gallery()),
                  (Route route) => route.isFirst,
                );
              } else if (item == 'EVENTS') {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const Events()),
                  (Route route) => route.isFirst,
                );
              } else if (item == 'WAITER') {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const WaiterHome()),
                  (Route route) => route.isFirst,
                );
              } else if (item == 'ADMIN') {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const AdminHome()),
                  (Route route) => route.isFirst,
                );
              } else {
                Navigator.pop(context);
              }
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
