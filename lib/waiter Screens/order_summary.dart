import 'package:flutter/material.dart';
import 'package:west33/waiter%20Screens/waiter_home.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

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
                        'Summary',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                        color: const Color(0xffDCCDCD).withOpacity(0.27),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        'Edit',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
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
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                            const Text(
                              '5',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                          ],
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
                        'RS. 150',
                        style: TextStyle(
                            color: Color(0xffAA9F9F),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                            const Text(
                              '5',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                          ],
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
                        'RS. 150',
                        style: TextStyle(
                            color: Color(0xffAA9F9F),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                            const Text(
                              '5',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                          ],
                        ),
                      )),
                  const Divider(
                    color: Color(0xffBDB1B1),
                  ),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 12.0),
                      child: Column(
                        children: [
                          Text(
                            'Subtotal:  Rs.1500',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'VAT(13%):  Rs.200',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text('Total:  Rs.15200',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const WaiterHome();
                }));
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Order creatred Successfully')));
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                    color: const Color(0xffC34C00),
                    borderRadius: BorderRadius.circular(6)),
                child: const Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Text(
                      textAlign: TextAlign.center,
                      'Confirm Order',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
