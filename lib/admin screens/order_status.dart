import 'package:flutter/material.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
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
            Center(
              child: Text(
                'Table 1',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xff111010),
                  borderRadius: BorderRadius.circular(14)),
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  const Divider(
                    color: Color(0xffBDB1B1),
                  ),
                  ListTile(
                      title: const Text(
                        'Burger',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle: const Text(
                        'RS. 150',
                        style: TextStyle(
                            color: Color(0xffAA9F9F),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Container(
                        color: Color(0xff292929),
                        height: 35,
                        width: 40,
                        child: Center(
                          child: const Text(
                            'x5',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      )),
                  const Divider(
                    color: Color(0xffBDB1B1),
                  ),
                  ListTile(
                      title: const Text(
                        'Burger',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle: const Text(
                        'No extra species,cheese, No beef',
                        style: TextStyle(
                            color: Color(0xffAA9F9F),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Container(
                        color: Color(0xff292929),
                        height: 40,
                        width: 35,
                        child: Center(
                          child: const Text(
                            'x5',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      )),
                  const Divider(
                    color: Color(0xffBDB1B1),
                  ),
                  // const Align(
                  //   alignment: Alignment.bottomRight,
                  //   child: Padding(
                  //     padding: EdgeInsets.only(right: 12.0),
                  //     child: Column(
                  //       children: [
                  //         Text(
                  //           'Subtotal:  Rs.1500',
                  //           style: TextStyle(color: Colors.white),
                  //         ),
                  //         Text(
                  //           'VAT(13%):  Rs.200',
                  //           style: TextStyle(color: Colors.white),
                  //         ),
                  //         Text('Total:  Rs.15200',
                  //             style: TextStyle(color: Colors.white)),
                  //       ],
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
