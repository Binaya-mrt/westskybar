import 'package:flutter/material.dart';

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
