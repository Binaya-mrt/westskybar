import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:west33/BOOKING/APIService/bookingService.dart';
import 'package:west33/appbar.dart';
import 'package:west33/USER%20SCREENS/homePage.dart';
import 'package:west33/widgets/customDrawer.dart';

// THIS IS THE LAST PAGE OF BOOKING FLOW
// THIS SHOWS THE DETAILS USER HAVE ENTERED DURING BOOKING AND CAN CONFIRM

// TODO: EDIT THE DETIALS, CANCEL BOOKING.

class Confirmtable extends StatefulWidget {
  const Confirmtable(
      {super.key,
      required this.arrivalTime,
      required this.date,
      required this.departureTime,
      required this.noOfGuest,
      required this.tableId});
  final DateTime date;
  final String arrivalTime;
  final String departureTime;
  final int noOfGuest;
  final String tableId;

  @override
  State<Confirmtable> createState() => _ConfirmtableState();
}

class _ConfirmtableState extends State<Confirmtable> {
  final GlobalKey<ScaffoldState> _key9 = GlobalKey();
  // Create a key
  void makeBooking() async {
    try {
      final isAvailable = await createBooking(
          tableId: widget.tableId,
          date: widget.date,
          arrivalTime: widget.arrivalTime,
          departureTime: widget.departureTime,
          guestNo: widget.noOfGuest);

      log(isAvailable.toString());
      if (isAvailable == 201) {
        // Table is available, proceed to the next step
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              '✅ Table Booked Successfully',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error checking table availability.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key9,
        backgroundColor: Colors.black,
        appBar: MyAppBar(okay: _key9),
        drawer: const CustomDrawer(),
        body: SafeArea(
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Image.asset('assets/images/8seat.png'),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                color: Colors.black, // Adjusted for design
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Adjust padding as needed
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Container(
                          width: 50,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Type: Dinner',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'Number of guest: ${widget.noOfGuest}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'Date: ${widget.date.day}-${widget.date.month}-${widget.date.year}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'Arrival Time: ${widget.arrivalTime}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'Leaving Time: ${widget.departureTime}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'Place: Indoor',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'Seat: 12 Seater',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    GestureDetector(
                      onTap: () {
                        makeBooking();
                        // Show Snackbar after the navigation completes
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
                              'Confirm Table',
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
              ),
            ),
          ]),
        ));
  }
}
