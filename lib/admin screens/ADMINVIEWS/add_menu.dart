import 'dart:io';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:west33/admin%20screens/controller/menuController.dart';
import 'package:west33/admin%20screens/models/menu.dart';
import 'package:west33/utils/imagePicker.dart';

class AddMenu extends StatefulWidget {
  const AddMenu({super.key});

  @override
  State<AddMenu> createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {
  late SingleValueDropDownController _cnt;

  @override
  void initState() {
    _cnt = SingleValueDropDownController();
    super.initState();
  }

  @override
  void dispose() {
    _cnt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> items = ['Sittan', 'Drinks', 'Snakcs'];
    String selectedItem = items.first;

    final TextEditingController dishName = TextEditingController();
    final TextEditingController price = TextEditingController();
    final TextEditingController detail = TextEditingController();
    final menuController = Provider.of<MenuProvider>(context);

    File? _imageFile;
    // price;detail

    double height = MediaQuery.of(context).size.height;
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
                        const Text(
                          'Category',
                          style: textstyleHead,
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        DropdownButton<String>(
                          // Value that is initially selected (optional)
                          value: items.first,
                          // Dropdown items
                          items: items.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          // Dropdown onChanged function
                          onChanged: (String? newValue) {
                            // Handle dropdown value change
                            if (newValue != null) {
                              selectedItem = newValue; // Update selected item
                              // print('Selected value: $newValue');
                              // You can use newValue here to perform actions based on the selected item
                            }
                          },
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        const Text(
                          'Dish Name',
                          style: textstyleHead,
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Textform(
                          name: 'Enter name',
                          controller: dishName,
                          no_of_lines: 1,
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        const Text(
                          'Price',
                          style: textstyleHead,
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Textform(
                          name: 'Enter price',
                          controller: price,
                          no_of_lines: 1,
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
                          'Dish Picture',
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
                                  'Upload a picture of the dish',
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
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 18, 10, 18),
                child: GestureDetector(
                  onTap: () async {
                    if (_imageFile != null) {
                      MenuItem menu = MenuItem(
                          name: dishName.text,
                          category: selectedItem,
                          price: int.parse(price.text),
                          detail: detail.text);
                      menuController.postMenuItems(menu, _imageFile!);
                    } else {
                      print('Please pick an image first');
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: height * 0.04,
                    decoration: BoxDecoration(
                        color: const Color(0xffFF823C),
                        borderRadius: BorderRadius.circular(4)),
                    child: const Center(
                        child: Text('Add Menu', style: textstyleHead)),
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
  const Textform({
    required this.name,
    required this.no_of_lines,
    required this.controller,
    super.key,
  });
  final String name;
  final int no_of_lines;
  final TextEditingController controller;
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
      controller: controller,
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
