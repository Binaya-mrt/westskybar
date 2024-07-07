import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:west33/BOOKING/APIService/cartService.dart';
import 'package:west33/BOOKING/Controller/cartController.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cartController = Provider.of<CartProvider>(context, listen: false);
      cartController.fetchCart("66838b68de04dca9b9da2089");
    });
  }

  List<Map<String, dynamic>> prepareCartData(List<Cart> carts) {
    return carts.map((cart) {
      return {
        'productId': cart.product!.id,
        'quantity': cart.quantity,
      };
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartProvider>(context);
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
              const SizedBox(height: 15),
              cartController.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : cartController.allCarts == null
                      ? const Center(
                          child: Text(
                          'Your cart is empty',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ))
                      : cartController.allCarts!.isEmpty
                          ? const Center(
                              child: Text(
                              'Your Cart is Empty!',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ))
                          : Expanded(
                              child: ListView.builder(
                                itemCount: cartController.allCarts!.length,
                                itemBuilder: (context, index) {
                                  Cart table = cartController.allCarts![index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 9.0),
                                    child: ListTile(
                                      tileColor: Colors.amber[200],
                                      title: Row(children: [
                                        Text('Item: ${index + 1} '),
                                        Text(
                                          table.product!.name,
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ]),
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
                                            ),
                                          ]),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
              Spacer(),
              if (cartController.allCarts!.isNotEmpty)
                GestureDetector(
                  onTap: () async {
                    List<Cart> carts = cartController.allCarts ?? [];
                    List<Map<String, dynamic>> cartData =
                        prepareCartData(carts);

                    try {
                      int status = await CartService().sendOrderData(
                        cartData,
                        '66838b68de04dca9b9da2089',
                      );
                      if (status == 201) {
                        await CartService()
                            .clearCart("66838b68de04dca9b9da2089");
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => HomePage()),
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
                    } catch (error) {
                      // Handle error here, e.g., show a snackbar with an error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '❌ Failed to add order to cart!',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      );
                    }
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
      ),
    );
  }
}
