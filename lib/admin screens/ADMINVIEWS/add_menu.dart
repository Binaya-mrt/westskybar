import 'dart:developer';
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
  late TextEditingController dishName;
  late TextEditingController price;
  late TextEditingController detail;
  File? imageFile;
  String selectedItem = 'Sittan';

  @override
  void initState() {
    // _cnt = SingleValueDropDownController();
    dishName = TextEditingController();
    price = TextEditingController();
    detail = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // _cnt.dispose();
    dishName.dispose();
    price.dispose();
    detail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> items = ['Sittan', 'Drinks', 'Snacks'];
    final menuController = Provider.of<MenuProvider>(context);
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
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
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
                        value: selectedItem,
                        items: items.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedItem = newValue!;
                          });
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
                              imageFile = pickedImage;
                            });
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: height * 0.2,
                          color: const Color(0xff4C4444),
                          child: imageFile != null
                              // ? Text("Image selected")
                              ? Image.file(imageFile!)
                              : const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.upload,
                                        color: Color(0xffAA9F9F)),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 18, 10, 18),
                child: GestureDetector(
                  onTap: () async {
                    if (imageFile != null) {
                      MenuItem menu = MenuItem(
                          name: dishName.text,
                          category: selectedItem,
                          price: int.parse(price.text),
                          detail: detail.text,
                          isAvailable: true);
                      menuController.postMenuItems(menu, imageFile!);
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
