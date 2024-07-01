import 'package:flutter/material.dart';
import 'package:west33/waiter%20Screens/table_screen.dart';
import 'package:west33/widgets/sliderAnimation.dart';

/// THIS IS THE SCREEN WHERE WAITER SELECTS THE TABLE TO TAKE ORDER OF.
/// ON CLICKING IT WILL NAVIGATE TO SIMPLE MENU PAGE, WHERE HE CAN SELCTS THE ORDER.
class WaiterHome extends StatelessWidget {
  const WaiterHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Image.asset('assets/images/logo.png'),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20, top: 10),
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
                    color: const Color(0xffE46615)
                        .withOpacity(0.82), // Background color for active tab
                    borderRadius: BorderRadius.circular(19),
                    border:
                        Border.all(color: const Color(0xffC1B9B9), width: 1),
                  ),
                  tabs: const [
                    SizedBox(
                      height: 32,
                      width: 86,
                      child: Tab(text: "Indoor"),
                    ),
                    SizedBox(
                      height: 32,
                      width: 86,
                      child: Tab(text: "Outdoor"),
                    ),
                    SizedBox(
                      height: 32,
                      width: 86,
                      child: Tab(text: "Rooftop"),
                    ),
                  ],
                ),
              ),
            ),
            // const Expanded(
            //   child: TabBarView(
            //     physics: NeverScrollableScrollPhysics(),
            //     children: [
            //       Padding(
            //         padding: EdgeInsets.only(top: 8.0),
            //         child: WaiterIndoor(),
            //       ),
            //       Padding(
            //         padding: EdgeInsets.only(top: 8.0),
            //         child: TableIndoor(),
            //       ),
            //       Padding(
            //         padding: EdgeInsets.only(top: 8.0),
            //         child: TableIndoor(),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class WaiterIndoor extends StatelessWidget {
  const WaiterIndoor({super.key});

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
      crossAxisCount = 3;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        children: [
          GestureDetector(
            onTap: () {
              navigateToPage(context, const TableOrder());
            },
            child: Container(
              height: 30,
              width: 30,
              color: Colors.grey,
              child: const Center(
                child: Text(
                  'Table 1',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              height: 30,
              width: 30,
              color: Colors.grey,
              child: const Text(
                'Table 1',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              height: 30,
              width: 30,
              color: Colors.grey,
              child: const Text(
                'Table 2',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              height: 30,
              width: 30,
              color: Colors.grey,
              child: const Text(
                'Table 3',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              height: 30,
              width: 30,
              color: Colors.grey,
              child: const Text(
                'Table 4',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              height: 30,
              width: 30,
              color: Colors.grey,
              child: const Text(
                'Table 5',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
