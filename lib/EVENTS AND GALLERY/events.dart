import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:west33/admin%20screens/controller/eventController.dart';
import 'package:west33/appbar.dart';
import 'package:west33/widgets/floatingButton.dart';
import 'package:west33/widgets/customDrawer.dart';

// THIS IS EVENTS PAGE
//  THIS CONTAINS PREVIOUS AND UPCOMMING EVENTS

class Events extends StatelessWidget {
  const Events({super.key});

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     // Fetch events after the first frame
  //     Provider.of<EventProvider>(context, listen: false).fetchAllEvents();
  //   });
  // }

  // Create a key
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final eventController = Provider.of<EventProvider>(context);
    eventController.fetchAllEvents();
    final GlobalKey<ScaffoldState> key10 = GlobalKey(); // Create a key

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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                              'Events',
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
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "UPCOMING EVENTS",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: eventController.upcomingEvents!.length,
                  itemBuilder: (context, index) {
                    final event = eventController.upcomingEvents![index];

                    return eventController.allEvents!.isEmpty
                        ? const Center(child: Text('No upcomming available'))
                        : Container(
                            padding: const EdgeInsets.only(
                                left: 8, bottom: 5, top: 5),
                            margin: const EdgeInsets.only(right: 8),
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/images/event.png',
                                ),
                                fit: BoxFit.contain,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      event.title,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      event.detail,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      event.date.toString(),
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      'Time: ${event.time}',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                  },
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              const Text(
                "PREVIOUS EVENTS",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: 3 / 5,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 5),
                itemBuilder: (context, index) {
                  final event = eventController.upcomingEvents![index];

                  return eventController.previousEvents!.isEmpty
                      ? const Center(child: Text('No upcomming available'))
                      : Container(
                          color: Colors.black,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset('assets/images/gallery.jpg'),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                event.date.toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}



// Container(
//                     color: Colors.black,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Image.asset('assets/images/gallery.jpg'),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           '20th June, 2024',
//                           style: Theme.of(context).textTheme.titleMedium,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     color: Colors.black,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Image.asset('assets/images/gallery.jpg'),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           '20th June, 2024',
//                           style: Theme.of(context).textTheme.titleMedium,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     color: Colors.black,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Image.asset('assets/images/gallery.jpg'),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           '20th June, 2024',
//                           style: Theme.of(context).textTheme.titleMedium,
//                         ),
//                       ],
//                     ),
//                   ),