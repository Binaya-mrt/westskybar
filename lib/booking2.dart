import 'package:flutter/material.dart';
import 'package:west33/appbar.dart';
import 'package:west33/confirmtable.dart';
import 'package:west33/widgets/customDrawer.dart';

class BookingTable extends StatelessWidget {
  BookingTable({super.key});
  final GlobalKey<ScaffoldState> _key4 = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _key4,
        backgroundColor: Colors.black,
        appBar: MyAppBar(okay: _key4),
        drawer: const CustomDrawer(),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Row(
                  children: [
                    Icon(Icons.arrow_back_ios, color: Colors.white),
                    Text(
                      'Book a Table',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Place',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
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
              const Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: TableIndoor(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: TableIndoor(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: TableIndoor(),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Confirmtable();
                  }));
                },
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                      color: const Color(0xffC34C00),
                      borderRadius: BorderRadius.circular(6)),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Text(
                        textAlign: TextAlign.center,
                        'NEXT',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          ),
        )),
      ),
    );
  }
}

class TableIndoor extends StatefulWidget {
  const TableIndoor({super.key});

  @override
  State<TableIndoor> createState() => _TableIndoorState();
}

int? selectedImageIndex;

final List<String> imagePaths = [
  'assets/images/8seat.png',
  'assets/images/12seat.png',
  'assets/images/12seat.png',
  'assets/images/12seat.png',
  'assets/images/8seat.png',
  'assets/images/8seat.png',
];

class _TableIndoorState extends State<TableIndoor> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 15,
        ),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedImageIndex = index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: selectedImageIndex == index
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                  width: 3,
                ),
              ),
              child: Image.asset(
                imagePaths[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
