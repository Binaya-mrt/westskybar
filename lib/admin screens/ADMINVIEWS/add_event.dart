import 'dart:io';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:west33/utils/imagePicker.dart';
import 'package:west33/widgets/datepicker.dart';
import 'package:west33/widgets/timepicker.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  // late SingleValueDropDownController _cnt;
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final TextEditingController eventName = TextEditingController();
    final TextEditingController detail = TextEditingController();
    // final TextEditingController price = TextEditingController();
    DateTime selectedTime = DateTime.now();

    const textstyleHead = TextStyle(
        fontWeight: FontWeight.w400, fontSize: 18, color: Colors.white);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Row(
                  children: [
                    Icon(Icons.arrow_back_ios, color: Colors.white),
                    Text(
                      'Add Menu',
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
              Container(
                color: const Color(0xff111010),
                // height: 400,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.02,
                        ),
                        const Text(
                          'Event Name',
                          style: textstyleHead,
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Textform(
                          name: 'Enter name',
                          no_of_lines: 1,
                          controller: eventName,
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        const Text(
                          'Date',
                          style: textstyleHead,
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        date(),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        const Text(
                          'Time',
                          style: textstyleHead,
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        GestureDetector(
                          onTap: () async {
                            final TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(selectedTime),
                            );

                            if (pickedTime != null) {
                              setState(() {
                                print(pickedTime);
                                selectedTime = DateTime(
                                    // selectedTime.year,
                                    // selectedTime.month,
                                    // selectedTime.day,
                                    pickedTime.hour,
                                    pickedTime.minute);
                              });
                            }
                          },
                          child: TimePickerExample(
                            selectedTime: selectedTime,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        const Text(
                          'Details',
                          style: textstyleHead,
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Textform(
                          name: 'Enter details',
                          no_of_lines: 6,
                          controller: detail,
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        const Text(
                          'Event Poster Image',
                          style: textstyleHead,
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        GestureDetector(
                          onTap: () async {
                            File? pickedImage = await pickImage();
                            if (pickedImage != null) {
                              setState(() {
                                _imageFile = pickedImage;
                              });
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: height * 0.2,
                            color: const Color(0xff4C4444),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.upload, color: Color(0xffAA9F9F)),
                                Text(
                                  'Upload a poster of the event ',
                                  style: TextStyle(
                                      color: Color(0xffAA9F9F),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // const Spacer(),
              GestureDetector(
                onTap: () {
                  print('${selectedTime.hour}+${selectedTime.minute}');
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 18, 10, 18),
                  child: Container(
                    width: double.infinity,
                    height: height * 0.04,
                    decoration: BoxDecoration(
                        color: const Color(0xffFF823C),
                        borderRadius: BorderRadius.circular(4)),
                    child: const Center(
                        child: Text('Add Event', style: textstyleHead)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Textform extends StatelessWidget {
  Textform({
    required this.name,
    required this.no_of_lines,
    this.value,
    required this.controller,
    super.key,
  });
  final String name;
  final int no_of_lines;
  final TextEditingController controller;
  String? value;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: no_of_lines,
      cursorColor: const Color(0xffAA9F9F),
      style: const TextStyle(
          color: Color(0xffAA9F9F), fontSize: 16, fontWeight: FontWeight.w300),
      decoration: InputDecoration(
        hintText: name,
        hintStyle: const TextStyle(
            color: Color(0xffAA9F9F),
            fontSize: 16,
            fontWeight: FontWeight.w300),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff6C6060)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff6C6060)),
        ),
      ),
      initialValue: value,
    );
  }
}

class Dropdown extends StatelessWidget {
  const Dropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      textStyle: const TextStyle(
          color: Color(0xffAA9F9F), fontSize: 16, fontWeight: FontWeight.w300),
      textFieldDecoration: const InputDecoration(
        hintText: 'Select Category',
        hintStyle: TextStyle(
            color: Color(0xffAA9F9F),
            fontSize: 16,
            fontWeight: FontWeight.w300),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff6C6060)),
        ),
      ),
      listSpace: 20,
      listPadding: ListPadding(top: 20),
      validator: (value) {
        if (value == null) {
          return "Required field";
        } else {
          return null;
        }
      },
      dropDownList: const [
        DropDownValueModel(name: 'Breakfast', value: "value1"),
        DropDownValueModel(name: 'Dinner', value: "value2"),
        DropDownValueModel(name: 'Lunch', value: "value3"),
      ],
      listTextStyle: const TextStyle(color: Colors.black),
      dropDownItemCount: 3,
      onChanged: (val) {},
    );
  }
}
