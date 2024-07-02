import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:west33/admin%20screens/ADMINVIEWS/add_menu.dart';
import 'package:west33/admin%20screens/controller/admin_memu_controller.dart';
import 'package:west33/admin%20screens/controller/menuController.dart';
import 'package:west33/widgets/sliderAnimation.dart';

class AdminAllMenu extends StatefulWidget {
  const AdminAllMenu({super.key});

  @override
  State<AdminAllMenu> createState() => _AdminAllMenuState();
}

class _AdminAllMenuState extends State<AdminAllMenu> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    final menuController = Provider.of<MenuProvider>(context, listen: false);
    menuController.fetchAllMenuItems().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final menuController = Provider.of<MenuProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: null,
        title: Image.asset('assets/images/logo.png'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : menuController.allmenuItems == null ||
                  menuController.allmenuItems!.isEmpty
              ? const Center(child: Text('No menu available'))
              : Column(
                  children: [
                    const Text(
                      'All Menu',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: menuController.allmenuItems!.length,
                          itemBuilder: (context, index) {
                            var item = menuController.allmenuItems![index];

                            return GestureDetector(
                              onTap: () {
                                navigateToPage(
                                    context,
                                    EditMenu(
                                      item: item,
                                    ));
                              },
                              child: ListTile(
                                title: Text(
                                  item.name,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(item.detail),
                                trailing: CircleAvatar(
                                  backgroundColor: item.isAvailable!
                                      ? Colors.green
                                      : Colors.red,
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToPage(
            context,
            const AddMenu(),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
