import 'package:flutter/material.dart';
import 'package:west33/widgets/mydialog.dart';
import 'package:west33/waiter%20Screens/order_summary.dart';

///
/// ON CLICKING IT WILL NAVIGATE TO SIMPLE MENU PAGE, WHERE HE CAN SELCTS THE ORDER.
class TableOrders extends StatelessWidget {
  const TableOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset('assets/images/logo.png'),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Row(
                children: [
                  Icon(Icons.arrow_back_ios, color: Colors.white),
                  Text(
                    'Table 1',
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
              margin: const EdgeInsets.only(bottom: 20, top: 10),
              height: 40,
              padding: const EdgeInsets.only(
                left: 10,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xff474343).withOpacity(0.47)),
              child: TextFormField(
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10, bottom: 10),
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Color(0xff8F8484))),
              ),
            ),
            SizedBox(
              height: 34,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  tabAlignment: TabAlignment.start,
                  padding: const EdgeInsets.all(0),
                  dividerColor: Colors.black,
                  isScrollable: true,
                  labelColor: Colors.white,
                  unselectedLabelColor: const Color(0xff8D7474),
                  labelStyle: const TextStyle(
                      fontSize: 14.0, fontWeight: FontWeight.w500),
                  indicator: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: const Color(0xffE46615)
                        .withOpacity(0.82), // Background color for active tab
                    borderRadius: BorderRadius.circular(19),
                    border:
                        Border.all(color: const Color(0xffC1B9B9), width: 1),
                  ),
                  tabs: const [
                    SizedBox(
                      height: 32,
                      width: 86,
                      child: Tab(text: "All"),
                    ),
                    SizedBox(
                      height: 32,
                      width: 86,
                      child: Tab(text: "Drinks"),
                    ),
                    SizedBox(
                      height: 32,
                      width: 86,
                      child: Tab(text: "Snacks"),
                    ),
                    SizedBox(
                      height: 32,
                      width: 86,
                      child: Tab(text: "Foods"),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: WaiterMenu(),
                  ),
                  Center(child: Text("Transit Tab Content")),
                  Center(child: Text("Bike Tab Content")),
                  Center(child: Text("Transit Tab Content")),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

// IT IS THE TABS LIKE USER IN HOME. FOR ALL, FOOD DRINNKS IT WILL HAVE DIFFERENT TABS.
//  THIS WILL NAVIGATE TO

class WaiterMenu extends StatelessWidget {
  const WaiterMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => Mydialog(
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            );
          },
          title: const Text(
            'Chicken MoMO',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          subtitle: const Text(
            'RS. 150',
            style: TextStyle(
                color: Color(0xffAA9F9F),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => const Mydialog(),
                );
              },
              icon: const CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 20,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )),
        ),
        const Divider(
          color: Color(0xffBDB1B1),
        ),
        ListTile(
          title: const Text(
            'Burger',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          subtitle: const Text(
            'RS. 150',
            style: TextStyle(
                color: Color(0xffAA9F9F),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => const Mydialog(),
                );
              },
              icon: const CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 20,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )),
        ),
        const Divider(
          color: Color(0xffBDB1B1),
        ),
        ListTile(
          title: const Text(
            'Pizza',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          subtitle: const Text(
            'RS. 150',
            style: TextStyle(
                color: Color(0xffAA9F9F),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 20,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )),
        ),
        const Divider(
          color: Color(0xffBDB1B1),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const OrderSummary();
            }));
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
    );
  }
}
