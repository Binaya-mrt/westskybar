import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:west33/BOOKING/APIService/bookingService.dart';
import 'package:west33/BOOKING/Controller/tableController.dart';
import 'package:west33/appbar.dart';
import 'package:west33/BOOKING/confirmtable.dart';
import 'package:west33/widgets/customDrawer.dart';
import 'Model/table.dart';

// THIS IS THE FIRST PAGE OF BOOKING PAGE
// THIS PROVIDES USER INTERFACE TO SELECT THE TABLE  AND TABBAR TO
// DIFFERENT LOCATION OF TABLE

class BookingTable extends StatefulWidget {
  const BookingTable(
      {super.key,
      required this.arrivalTime,
      required this.date,
      required this.leavingTime,
      required this.noOfGuest});
  final DateTime date;
  final TimeOfDay arrivalTime;
  final TimeOfDay leavingTime;
  final int noOfGuest;

  @override
  State<BookingTable> createState() => _BookingTableState();
}

class _BookingTableState extends State<BookingTable> {
  final GlobalKey<ScaffoldState> _key4 = GlobalKey();
  String selectedTableId = "";
  bool isTableAvailable = false;

  @override
  void initState() {
    super.initState();
    final tableController = Provider.of<TableProvider>(context, listen: false);
    tableController.fetchAllTables();
  }

  @override
  Widget build(BuildContext context) {
    final tableController = Provider.of<TableProvider>(context);

    return Scaffold(
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
              'Select a Table on your preferences!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            tableController.allTables == null
                ? const Center(child: CircularProgressIndicator())
                : tableController.allTables!.isEmpty
                    ? const Center(child: Text('No tables available'))
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: tableController.allTables!.length,
                        itemBuilder: (context, index) {
                          TableModel table = tableController.allTables![index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 9.0),
                            child: ListTile(
                              onTap: () async {
                                setState(() {
                                  selectedTableId = table.id!;
                                });
                                try {
                                  var isAvailable =
                                      await checkTableAvailability(
                                    tableId: selectedTableId,
                                    date: widget.date,
                                    arrivalTime:
                                        widget.arrivalTime.format(context),
                                    departureTime:
                                        widget.leavingTime.format(context),
                                  );
                                  if (isAvailable) {
                                    setState(() {
                                      isTableAvailable = isAvailable;
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Table is not available for this time')),
                                    );
                                  }
                                } catch (e) {
                                  // Handle error
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Error checking table availability.')),
                                  );
                                }
                                // print(selectedTableId);
                              },
                              tileColor: selectedTableId == table.id!
                                  ? Colors.amber[200]
                                  : Colors.white,
                              title: Row(children: [
                                const Text('Table Number: '),
                                Text(
                                  table.tableNo.toString(),
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ]),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    const Text('Table Capacity: '),
                                    Text(
                                      table.capacity.toString(),
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 16),
                                    )
                                  ]),
                                  Row(children: [
                                    const Text('Location: '),
                                    Text(
                                      table.category,
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 16),
                                    )
                                  ]),
                                ],
                              ),
                              isThreeLine: true,
                            ),
                          );
                        },
                      ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                if (isTableAvailable) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Confirmtable(
                      tableId: selectedTableId,
                      date: widget.date,
                      arrivalTime: widget.arrivalTime.format(context),
                      departureTime: widget.leavingTime.format(context),
                      noOfGuest: widget.noOfGuest,
                    );
                  }));
                }
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
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
