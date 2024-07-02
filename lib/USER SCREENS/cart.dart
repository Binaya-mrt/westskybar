import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:west33/BOOKING/APIService/cartService.dart';
import 'package:west33/BOOKING/Controller/cartController.dart';
import 'package:west33/BOOKING/Controller/tableController.dart';
import 'package:west33/BOOKING/Model/cart.dart';
import 'package:west33/USER%20SCREENS/homePage.dart';
import 'package:west33/appbar.dart';
import 'package:west33/widgets/customDrawer.dart';

class UserCart extends StatefulWidget {
  const UserCart({super.key});

  @override
  State<UserCart> createState() => _UserCartState();
}

class _UserCartState extends State<UserCart> {
  @override
  void initState() {
    super.initState();
    final cartController = Provider.of<CartProvider>(context, listen: false);
    cartController.fetchCart("66838b68de04dca9b9da2089");
  }

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartProvider>(context);
    List<Map<String, dynamic>> prepareCartData(
        List<Cart> carts, String userId, String tableId) {
      return carts.map((cart) {
        return {
          'productId': cart.product.id,
          'quantity': cart.quantity,
          'guest': userId,
          'table': tableId
        };
      }).toList();
    }

    List<Cart> carts = cartController.allCatrts!;
    List<Map<String, dynamic>> cartData = prepareCartData(
        carts, '66838b68de04dca9b9da2089', "667d066621ba969058c40e28");
    // this is user id
    cartController.fetchCart("66838b68de04dca9b9da2089");
    final GlobalKey<ScaffoldState> _key01 = GlobalKey();

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: MyAppBar(okay: _key01),
        drawer: const CustomDrawer(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_back_ios, color: Colors.white),
                      Text(
                        'Your Cart',
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
                cartController.allCatrts == null
                    ? const Center(child: Text('Your cart is empty'))
                    : cartController.allCatrts!.isEmpty
                        ? const Center(child: Text('No tables available'))
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: cartController.allCatrts!.length,
                            itemBuilder: (context, index) {
                              Cart table = cartController.allCatrts![index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 9.0),
                                child: ListTile(
                                  tileColor: Colors.amber[200],
                                  title: Row(children: [
                                    Text('Item: ${index + 1} '),
                                    Text(
                                      table.product.name,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ]),

                                  // TODO: need to fix null error when loading
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(children: [
                                        const Text('Quantity '),
                                        Text(
                                          table.quantity.toString(),
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 16),
                                        )
                                      ]),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                Spacer(),
                GestureDetector(
                  onTap: () async {
                    // int status =
                    //     await CartService().sendCartData(userId, products);
                    // if (status == 200) {
                    //   Navigator.of(context).pushAndRemoveUntil(
                    //     MaterialPageRoute(builder: (context) => HomePage()),
                    //     (Route route) => route.isFirst,
                    //   );

                    // Show Snackbar after the navigation completes
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(
                    //       content: Text(
                    //         '✅ Order Added to cart successfully!',
                    //         style: TextStyle(
                    //             color: Colors.green,
                    //             fontSize: 18,
                    //             fontWeight: FontWeight.w500),
                    //       ),
                    //     ),
                    //   );
                    // }
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
                            'Order',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
