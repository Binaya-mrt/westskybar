import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    super.key,
    required this.desc,
    required this.image,
    required this.title,
    required this.fun,
  });
  final String image;
  final String title;
  final String desc;
  final VoidCallback fun;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print('Hello 2');

        fun();
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
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
    );
  }
}
