import 'package:flutter/material.dart';
import 'package:west33/appbar.dart';
import 'package:west33/BOOKING/bookingTable.dart';
import 'package:west33/widgets/customDrawer.dart';

class Book extends StatefulWidget {
  const Book({super.key});

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  final GlobalKey<ScaffoldState> key7 = GlobalKey();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedArrivalTime = TimeOfDay.now();
  TimeOfDay selectedLeavingTime = TimeOfDay.now();
  int numberOfGuests = 1;
  String selectedFilter = "";

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
              FilterChipDisplay(
                selectedFilter: selectedFilter,
                onSelectedFilterChanged: (String filter) {
                  setState(() {
                    selectedFilter = filter;
                  });
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Text(
                'Number of Guests',
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            if (numberOfGuests > 1) numberOfGuests--;
                          });
                        },
                      ),
                      Text(
                        '$numberOfGuests',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            numberOfGuests++;
                          });
                        },
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
              GestureDetector(
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null && pickedDate != selectedDate) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Theme.of(context).primaryColor)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
                        style: const TextStyle(
                            fontSize: 18, color: Color(0xffDCDADA)),
                      ),
                      const Icon(
                        Icons.calendar_month,
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
                'Arrival Time',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffDCDADA)),
              ),
              GestureDetector(
                onTap: () async {
                  final TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: selectedArrivalTime,
                  );
                  if (pickedTime != null) {
                    setState(() {
                      selectedArrivalTime = pickedTime;
                    });
                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Theme.of(context).primaryColor)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedArrivalTime.format(context),
                        style: const TextStyle(
                            fontSize: 18, color: Color(0xffDCDADA)),
                      ),
                      const Icon(
                        Icons.punch_clock,
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
                'Leaving Time',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffDCDADA)),
              ),
              GestureDetector(
                onTap: () async {
                  final TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: selectedLeavingTime,
                  );
                  if (pickedTime != null) {
                    setState(() {
                      selectedLeavingTime = pickedTime;
                    });
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Theme.of(context).primaryColor)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedLeavingTime.format(context),
                        style: const TextStyle(
                            fontSize: 18, color: Color(0xffDCDADA)),
                      ),
                      const Icon(
                        Icons.punch_clock,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BookingTable(
                      arrivalTime: selectedArrivalTime,
                      date: selectedDate,
                      leavingTime: selectedLeavingTime,
                      noOfGuest: numberOfGuests,
                    );
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
                    child: Center(
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

class FilterChipDisplay extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String> onSelectedFilterChanged;

  const FilterChipDisplay({
    super.key,
    required this.selectedFilter,
    required this.onSelectedFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, bool> isSelected0 = {
      'Breakfast': false,
      'Lunch': false,
      'Dinner': false,
      'General': false,
      'Birthday': false,
      'Special': false,
      'Private event': false,
    };

    return Wrap(
      spacing: 10.0,
      children: isSelected0.keys.map((String name) {
        final bool isSelected = selectedFilter == name;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: ChoiceChip(
            backgroundColor: const Color(0xff292929),
            selectedColor: const Color(0xffC34C00),
            checkmarkColor: Colors.white,
            label: Text(
              name,
              style: TextStyle(
                color: isSelected
                    ? const Color(0xffF7F0F0)
                    : const Color(0xff8F8989),
              ),
            ),
            selected: isSelected,
            onSelected: (bool selected) {
              onSelectedFilterChanged(selected ? name : '');
            },
          ),
        );
      }).toList(),
    );
  }
}
