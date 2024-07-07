
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:west33/admin%20screens/ADMINVIEWS/order_status.dart';
import 'package:west33/admin%20screens/controller/orderController.dart';
import 'package:west33/widgets/sliderAnimation.dart';

class TableOverview extends StatelessWidget {
  const TableOverview({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);

    const textstyleHead = TextStyle(
        fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Row(
                children: [
                  Icon(Icons.arrow_back_ios, color: Colors.white),
                  Text(
                    'Table Overview',
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
            FutureBuilder(
              future: orderProvider.fetchOrders(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Expanded(
                    child: Consumer<OrderProvider>(
                      builder: (context, provider, child) {
                        return ListView.builder(
                          itemCount: provider.orders.length,
                          itemBuilder: (context, index) {
                            final tableOrder = provider.orders[index];

                            return Column(
                              children: [
                                TableNo(
                                  height: height,
                                  textStyle_head: textstyleHead,
                                  number: '${tableOrder.table.tableNo}',
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: 23,
                                      decoration: BoxDecoration(
                                          color: tableOrder.table.waiterStatus
                                              ? Colors.green
                                              : Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.people,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            'Waiter Status',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 23,
                                      decoration: BoxDecoration(
                                          color: tableOrder.table.billStatus
                                              ? Colors.green
                                              : Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.people,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            'Bill Status',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => navigateToPage(
                                          context,
                                          OrderStatus(
                                            products:
                                                tableOrder.orders[0].products,
                                          )),
                                      child: Container(
                                        height: 23,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Row(
                                          children: [
                                            Icon(
                                              Icons.people,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              'Order Status',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TableNo extends StatelessWidget {
  const TableNo(
      {super.key,
      required this.height,
      required this.textStyle_head,
      required this.number});

  final double height;
  final TextStyle textStyle_head;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.rocket,
            color: Colors.white,
          ),
          SizedBox(
            width: height * 0.005,
          ),
          Text(
            'Table $number',
            style: textStyle_head,
          )
        ],
      ),
    );
  }
}

class Various_status extends StatelessWidget {
  const Various_status({
    super.key,
    required this.height,
    required this.colour,
    required this.icon,
    required this.textstatus,
  });

  final double height;
  final Color colour;
  final IconData icon;
  final String textstatus;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.only(left: 05),
      height: height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: colour,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(icon), Text(textstatus)],
      ),
    ));
  }
}
