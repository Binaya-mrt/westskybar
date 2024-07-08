import 'package:flutter/material.dart';
import 'package:west33/Auth/presentation/screens/loginScreen.dart';

class ChangepasswordScreen extends StatelessWidget {
  const ChangepasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset('assets/images/logo.png'),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtuphMb4mq-EcVWhMVT8FCkv5dqZGgvn_QiA&s'),
              ),
              const SizedBox(
                height: 14,
              ),
              const Text(
                'Sandesh Basnet',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const Text(
                '+977-9865259306',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xff484444))),
                child: TextFormField(
                  // controller: controller,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      size: 14,
                      Icons.lock,
                      color: Color(0xff8F8989),
                    ),
                    contentPadding: EdgeInsets.only(left: 10, bottom: 20),
                    border: InputBorder.none,
                    hintText: 'Enter Old Password',
                    hintStyle: TextStyle(color: Color(0xff8F8989)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xff484444))),
                child: TextFormField(
                  // controller: controller,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      size: 14,
                      Icons.lock,
                      color: Color(0xff8F8989),
                    ),
                    contentPadding: EdgeInsets.only(left: 10, bottom: 20),
                    border: InputBorder.none,
                    hintText: 'Enter New Password',
                    hintStyle: TextStyle(color: Color(0xff8F8989)),
                  ),
                ),
              ),
              const Spacer(),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: Container(
                  width: double.infinity,
                  height: 42,
                  decoration: BoxDecoration(
                      color: const Color(0xffC34C00),
                      borderRadius: BorderRadius.circular(6)),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 12, bottom: 10),
                    child: Center(
                      child: Text(
                          textAlign: TextAlign.center,
                          'Save Changes',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
