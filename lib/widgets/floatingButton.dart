import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

// Assuming you have the SpeedDial package installed

class CustomFloatingActionButtons extends StatelessWidget {
  final String waiterIconPath;
  final String helpIconPath;
  final VoidCallback? waiterOnTap;
  final VoidCallback? helpOnTap;

  const CustomFloatingActionButtons({
    super.key,
    required this.waiterIconPath,
    required this.helpIconPath,
    this.waiterOnTap,
    this.helpOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return SpeedDial(
        renderOverlay: false,
        backgroundColor: const Color(0xffDD7431),
        visible: true,
        curve: Curves.bounceIn,
        children: [
          SpeedDialChild(
            child: Image.asset(waiterIconPath),
            backgroundColor: const Color(0xffDD7431),
            onTap: waiterOnTap ??
                (() {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Tooltip 1"),
                        content: const Text("This is the first button."),
                        actions: <Widget>[
                          ElevatedButton(
                            child: const Text("Close"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }),
            label: 'Call a Waiter',
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
          SpeedDialChild(
            child: const Icon(Icons.help_outline),
            backgroundColor: Colors.green,
            onTap: helpOnTap ??
                (() {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Tooltip 2"),
                        content: const Text("This is the second button."),
                        actions: <Widget>[
                          ElevatedButton(
                            child: const Text("Close"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }),
            label: 'Ask for Bill',
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
          SpeedDialChild(
            child: const Icon(Icons.help_outline),
            backgroundColor: Colors.green,
            onTap: helpOnTap ??
                (() {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Tooltip 2"),
                        content: const Text("This is the second button."),
                        actions: <Widget>[
                          ElevatedButton(
                            child: const Text("Close"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }),
            label: 'Cart',
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
        child: Image.asset(waiterIconPath),
      );
    });
  }
}
