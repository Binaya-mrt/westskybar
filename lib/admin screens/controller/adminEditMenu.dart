import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:west33/admin%20screens/ADMINVIEWS/add_event.dart';
import 'package:west33/admin%20screens/ADMINVIEWS/admin_all_menu.dart';
import 'package:west33/admin%20screens/controller/menuController.dart';
import 'package:west33/admin%20screens/models/menu.dart';
import 'package:west33/constants.dart';
import 'package:west33/utils/imagePicker.dart';
import 'package:west33/widgets/sliderAnimation.dart';

class EditMenu extends StatefulWidget {
  const EditMenu({super.key, required this.item});
  final MenuItem item;

  @override
  State<EditMenu> createState() => _EditMenuState();
}

class _EditMenuState extends State<EditMenu> {
  bool _isSwitched = false;
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

    _isSwitched = widget.item.isAvailable;
    log(widget.item.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // bool _isSwitched = widget.item.isAvailable;
    final List<String> items = ['Sittan', 'Drinks', 'Snacks'];
    final menuController = Provider.of<MenuProvider>(context);
    double height = MediaQuery.of(context).size.height;
    const textstyleHead = TextStyle(
        fontWeight: FontWeight.w400, fontSize: 18, color: Colors.white);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: null,
        title: Image.asset('assets/images/logo.png'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Add Menu',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                        Column(
                          children: [
                            Switch(
                              value: _isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  _isSwitched = value;
                                });
                                log(_isSwitched.toString());
                              },
                            ),
                            Text(
                              'Available',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            )
                          ],
                        )
                      ],
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
                      value: widget.item.name,
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
                      value: widget.item.price.toString(),
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
                      value: widget.item.detail,
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 18, 10, 18),
                      child: GestureDetector(
                        onTap: () async {
                          MenuItem menu = MenuItem(
                              name: dishName.text,
                              category: selectedItem,
                              price: int.parse(price.text),
                              detail: detail.text,
                              isAvailable: _isSwitched);
                          await menuController.updateMenuItems(
                              menu, widget.item.id!);
                        },
                        child: Container(
                          width: double.infinity,
                          height: height * 0.04,
                          decoration: BoxDecoration(
                              color: const Color(0xffFF823C),
                              borderRadius: BorderRadius.circular(4)),
                          child: const Center(
                              child: Text('Update Menu', style: textstyleHead)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 18, 10, 18),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                    'Are you sure to delete ${widget.item.name}?'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(
                                          context); // Close the dialog
                                    },
                                    child: Text('Cancel'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      log(widget.item.id!);
                                      // Disable the button while the operation is in progress
                                      setState(() {});
                                      await menuController
                                          .deleteMenuItems(widget.item.id!);
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Item deleted successfully!')));
                                      // Optionally, show feedback to the user
                                    },
                                    child: Text('Yes, Sure'),
                                    // Initially disable the button
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: height * 0.04,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4)),
                          child: const Center(
                              child: Text('Delete Menu', style: textstyleHead)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
