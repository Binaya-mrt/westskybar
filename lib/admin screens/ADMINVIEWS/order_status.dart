import 'package:flutter/material.dart';
import 'package:west33/admin%20screens/models/order.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({super.key, required this.products});
  final List<ProductDetails> products;

  double calculateTotalAmount(List<ProductDetails> products) {
    double total = 0.0;
    for (var product in products) {
      total += product.price * product.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    print(products);
    double totalAmount = calculateTotalAmount(products);
    double vatAmount = totalAmount * 0.13; // VAT is 13%
    double subtotal = totalAmount + vatAmount;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Image.asset('assets/images/logo.png'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_back_ios, color: Colors.white),
                      Text(
                        'Order Status',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Center(
              child: Text(
                'Table 1',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const Divider(
              color: Color(0xffBDB1B1),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xff111010),
                  borderRadius: BorderRadius.circular(14)),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Column(
                    children: [
                      ListTile(
                          title: Text(
                            product.productName,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(
                            'RS. ${product.price}',
                            style: TextStyle(
                                color: Color(0xffAA9F9F),
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: Container(
                            color: const Color(0xff292929),
                            height: 35,
                            width: 40,
                            child: Center(
                              child: Text(
                                'x${product.quantity}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          )),
                      const Divider(
                        color: Color(0xffBDB1B1),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Subtotal:  Rs.${totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'VAT(13%):  Rs.${vatAmount.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Total:  Rs.${subtotal.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.white),
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
