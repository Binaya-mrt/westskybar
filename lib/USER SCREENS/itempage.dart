import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:west33/BOOKING/APIService/cartService.dart';
import 'package:west33/USER%20SCREENS/homePage.dart';
import 'package:west33/admin%20screens/models/menu.dart';
import 'package:west33/constants.dart';
import 'package:west33/widgets/mydialog.dart';

// THIS IS THE PRODUCT DETAIL PAGE

class ItemPage extends StatefulWidget {
  const ItemPage({super.key, required this.item});
  final MenuItem item;

  @override
  _ItemPageState createState() => _ItemPageState();
}

int quantity = 1;

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    log('$ImageURL/${widget.item.image}');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // Main content
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('$ImageURL${widget.item.image}'),
                        fit: BoxFit.cover,
                        opacity: 0.6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Row(
                          children: [
                            const Icon(Icons.arrow_back_ios,
                                color: Colors.white),
                            Text(widget.item.category,
                                style:
                                    Theme.of(context).textTheme.headlineMedium)
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            DraggableScrollableSheet(
              initialChildSize: 0.08,
              minChildSize: 0.05,
              maxChildSize: 0.4,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.black, // Adjusted for design
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: ListView(controller: scrollController, children: [
                    Padding(
                      padding: const EdgeInsets.all(
                          16.0), // Adjust padding as needed
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            widget.item.price.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white, // Adjust text color
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.item.name,
                            style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffE0DED8)),
                          ),
                          const SizedBox(height: 8),
                          // const SizedBox(height: 8),
                          Text(
                            widget.item.detail,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff72716D)),
                          ),

                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                              width: 126,
                              height: 48,
                              color: const Color(0xff292929),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove,
                                        color: Colors.white),
                                    onPressed: () {
                                      setState(() {
                                        if (quantity > 1) quantity--;
                                      });
                                    },
                                  ),
                                  Text(
                                    '$quantity',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add,
                                        color: Colors.white),
                                    onPressed: () {
                                      setState(() {
                                        quantity++;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                String userId = '66838b68de04dca9b9da2089';
                                List<Map<String, dynamic>> products = [
                                  {
                                    "productId": widget.item.id,
                                    "quantity": quantity,
                                  },
                                ];

                                int status = await CartService()
                                    .sendCartData(userId, products);
                                if (status == 200) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()),
                                    (Route route) => route.isFirst,
                                  );

                                  // Show Snackbar after the navigation completes
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        '✅ Order Added to cart successfully!',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(
                                    0xffBB5311), // Adjusted button color
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                minimumSize: const Size(
                                    double.infinity, 50), // Full width button
                              ),
                              child: const Center(
                                child: Text(
                                  'ADD TO CART',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
