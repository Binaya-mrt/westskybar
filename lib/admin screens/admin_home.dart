import 'package:flutter/material.dart';
import 'package:west33/admin%20screens/add_event.dart';
import 'package:west33/admin%20screens/add_menu.dart';
import 'package:west33/admin%20screens/tableoverview.dart';
import 'package:west33/widgets/sliderAnimation.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

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
            Container(
              height: 40,
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xff474343).withOpacity(0.47)),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Color(0xff8F8484))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView(
              shrinkWrap: true,
              children: [
                GestureDetector(
                  onTap: () => navigateToPage(context, const AddMenu()),
                  child: ListTile(
                    title: const Text(
                      'Add Menu',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    trailing: CircleAvatar(
                      backgroundColor:
                          const Color(0xffDCCDCD).withOpacity(0.27),
                      child: IconButton(
                          onPressed: () {
                            navigateToPage(context, const AddMenu());
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
                const Divider(
                  color: Color(0xffBDB1B1),
                ),
                ListTile(
                  title: const Text(
                    'Add Gallery Link',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: const Color(0xffDCCDCD).withOpacity(0.27),
                    child: IconButton(
                        onPressed: () {
                          navigateToPage(context, const AddMenu());
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )),
                  ),
                ),
                const Divider(
                  color: Color(0xffBDB1B1),
                ),
                GestureDetector(
                  onTap: () => navigateToPage(context, const AddEvent()),
                  child: ListTile(
                    title: const Text(
                      'Create Event',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    trailing: CircleAvatar(
                      backgroundColor:
                          const Color(0xffDCCDCD).withOpacity(0.27),
                      child: IconButton(
                          onPressed: () {
                            navigateToPage(context, const AddEvent());
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
                const Divider(
                  color: Color(0xffBDB1B1),
                ),
                GestureDetector(
                  onTap: () => navigateToPage(context, TableOverview()),
                  child: ListTile(
                    title: const Text(
                      'Table Overview',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    trailing: CircleAvatar(
                      backgroundColor:
                          const Color(0xffDCCDCD).withOpacity(0.27),
                      child: IconButton(
                          onPressed: () {
                            navigateToPage(context, const TableOverview());
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
                const Divider(
                  color: Color(0xffBDB1B1),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
