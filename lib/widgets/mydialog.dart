import 'package:flutter/material.dart';

class Mydialog extends StatefulWidget {
  const Mydialog({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;

  @override
  State<Mydialog> createState() => _MydialogState();
}

int numberOfGuests = 1;

class _MydialogState extends State<Mydialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.height * 0.9,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
              // border: Border.all(color: const Color(0xff4E4848))
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Center(
                    child: Text('Select to confirm your order',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffDD7431))),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                    child: Divider(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      const Text(
                        'Quantity',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Color(0xffDCDADA)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          width: 126,
                          height: 48,
                          color: const Color(0xff292929),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove,
                                    color: Colors.white),
                                onPressed: () {
                                  setState(() {
                                    if (numberOfGuests > 1) numberOfGuests--;
                                  });
                                },
                              ),
                              Text(
                                '$numberOfGuests',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.add, color: Colors.white),
                                onPressed: () {
                                  setState(() {
                                    numberOfGuests++;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      widget.onTap!();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 42,
                      decoration: BoxDecoration(
                          color: const Color(0xff03AE00),
                          borderRadius: BorderRadius.circular(6)),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: Text(
                            textAlign: TextAlign.center,
                            'CONFIRM',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
