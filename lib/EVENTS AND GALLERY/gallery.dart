import 'package:flutter/material.dart';
import 'package:west33/appbar.dart';
import 'package:west33/widgets/floatingButton.dart';
import 'package:west33/widgets/customDrawer.dart';

// THIS IS THE GALLERY PAGE

class Gallery extends StatelessWidget {
  Gallery({super.key});

  final GlobalKey<ScaffoldState> key10 = GlobalKey(); // Create a key

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
      appBar: MyAppBar(okay: key10),
      drawer: const CustomDrawer(),
      floatingActionButton: CustomFloatingActionButtons(
        waiterIconPath: 'assets/images/fab.png',
        helpIconPath: Icons.help_outline
            .toString(), // Assuming you want to use an icon instead of an asset
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Row(
                          children: [
                            Icon(Icons.arrow_back_ios, color: Colors.white),
                            Text(
                              'GALLERY',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: IconButton(
                        onPressed: () async {
                          final DateTime? dateTime = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(3000),
                            initialDate: DateTime.now(),
                          );
                          if (dateTime != null) {
                            print(dateTime);
                          }
                        },
                        icon: const Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
              GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: 3 / 5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                children: [
                  Container(
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/gallery.jpg'),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          '20th June, 2024',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/gallery.jpg'),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          '20th June, 2024',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/gallery.jpg'),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          '20th June, 2024',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/gallery.jpg'),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          '20th June, 2024',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/gallery.jpg'),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          '20th June, 2024',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/gallery.jpg'),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          '20th June, 2024',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/gallery.jpg'),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          '20th June, 2024',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/gallery.jpg'),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          '20th June, 2024',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
