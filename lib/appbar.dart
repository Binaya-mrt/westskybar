import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.okay});
  final GlobalKey<ScaffoldState> okay;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Image.asset('assets/images/logo.png'),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          okay.currentState!.openDrawer();
        },
        child: Image.asset(
          'assets/images/More.png',
          width: 15,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Image.asset(
            'assets/images/bell.png',
            width: 20,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
