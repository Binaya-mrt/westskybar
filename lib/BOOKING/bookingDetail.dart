import 'package:flutter/material.dart';
import 'package:west33/appbar.dart';
import 'package:west33/BOOKING/bookingTable.dart';
import 'package:west33/widgets/customDrawer.dart';
import 'package:west33/widgets/datepicker.dart';
import 'package:west33/widgets/timepicker.dart';

// THIS IS THE FIRST PAGE OF BOOKING PAGE
// THIS PROVIDES USER INTERFACE TO ENTER NUMBER OF GUEST, TIME AND DATE

class Book extends StatefulWidget {
  Book({super.key});

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  final GlobalKey<ScaffoldState> key7 = GlobalKey();
  // Create a key
  DateTime selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(okay: key7),
      drawer: const CustomDrawer(),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                'Type',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffDCDADA)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const FilterChipDisplay(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Text(
                'Number of Guest',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Color(0xffDCDADA)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  width: 126,
                  height: 48,
                  color: const Color(0xff292929),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      Text(
                        '5',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              const Text(
                'Date',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffDCDADA)),
              ),
              const date(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              const Text(
                'Time',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffDCDADA)),
              ),
              GestureDetector(
                  onTap: () async {
                    final TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(selectedTime),
                    );

                    if (pickedTime != null) {
                      setState(() {
                        selectedTime = DateTime(
                            selectedTime.year,
                            selectedTime.month,
                            selectedTime.day,
                            pickedTime.hour,
                            pickedTime.minute);
                      });
                    }
                  },
                  child: TimePickerExample(selectedTime: selectedTime)),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BookingTable();
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
        ),
      ),
    );
  }
}

class FilterChipDisplay extends StatefulWidget {
  const FilterChipDisplay({super.key});

  @override
  _FilterChipDisplayState createState() => _FilterChipDisplayState();
}

class _FilterChipDisplayState extends State<FilterChipDisplay> {
  final List<String> _filters = [];
  final Map<String, bool> _isSelected = {
    'Breakfast': false,
    'Lunch': false,
    'Dinner': false,
    'General': false,
    'Birthday': false,
    'Special': false,
    'Private event': false,
  };

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      children: _isSelected.keys.map((String name) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: ChoiceChip(
            backgroundColor: const Color(0xff292929),
            selectedColor: const Color(0xffC34C00),
            checkmarkColor: Colors.white,
            label: Text(
              name,
              style: TextStyle(
                color: _isSelected[name]!
                    ? const Color(0xffF7F0F0)
                    : const Color(0xff8F8989),
              ),
            ),
            selected: _isSelected[name]!,
            onSelected: (bool selected) {
              setState(() {
                _isSelected[name] = selected;
                if (selected) {
                  _filters.add(name);
                } else {
                  _filters.removeWhere((String item) => item == name);
                }
              });
            },
          ),
        );
      }).toList(),
    );
  }
}
