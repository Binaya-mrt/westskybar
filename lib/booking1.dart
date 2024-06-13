import 'package:flutter/material.dart';
import 'package:west33/appbar.dart';
import 'package:west33/booking2.dart';
import 'package:west33/widgets/customDrawer.dart';

class Book extends StatelessWidget {
  Book({super.key});
  final GlobalKey<ScaffoldState> key7 = GlobalKey(); // Create a key

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
              const TimePickerExample(),
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

class date extends StatefulWidget {
  const date({
    super.key,
  });

  @override
  State<date> createState() => _dateState();
}

class _dateState extends State<date> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
      child: Container(
        width: double.infinity,
        // height: 109,
        decoration: const BoxDecoration(
            // borderRadius: BorderRadius.circular(8),
            color: Color(0xff292929)),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  final DateTime? dateTime = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(3000),
                    initialDate: selectedDate,
                  );
                  if (dateTime != null) {
                    setState(() {
                      selectedDate = dateTime;
                    });
                  }
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                      size: 21,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "${selectedDate.year} - ${selectedDate.month} - ${selectedDate.day}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TimePickerExample extends StatefulWidget {
  const TimePickerExample({super.key});

  @override
  State<TimePickerExample> createState() => _TimePickerExampleState();
}

class _TimePickerExampleState extends State<TimePickerExample> {
  DateTime selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Color(0xff292929)),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                child: Row(
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      color: Colors.white,
                      size: 21,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      "${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
