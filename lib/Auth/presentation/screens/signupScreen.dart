import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:west33/Auth/newtork/userServices.dart';
import 'package:west33/Auth/presentation/screens/loginScreen.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _confirmPasswordController =
    TextEditingController();
final TextEditingController _nameController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();

bool isObsecure = true;
final _formKey = GlobalKey<FormState>();

class _SignupscreenState extends State<Signupscreen> {
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          centerTitle: true,
          title: Image.asset('assets/images/logo.png'),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Register Here !',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFormField(
                          title: 'Name',
                          hint: 'Enter Name',
                          controller: _nameController,
                        ),
                        CustomFormField(
                          title: 'Email Address',
                          hint: 'Enter email',
                          controller: _emailController,
                        ),
                        CustomFormField(
                          title: 'Phone',
                          hint: 'Enter Phone',
                          controller: _phoneController,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xff484444),
                            ),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                            controller: _passwordController,
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            obscureText: isObsecure,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                hintText: 'Enter Password',
                                hintStyle:
                                    const TextStyle(color: Color(0xff8F8989)),
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  icon: Icon(isObsecure
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      isObsecure = !isObsecure;
                                    });
                                  },
                                )),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Confirm Password',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xff484444),
                            ),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                            controller: _confirmPasswordController,
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            obscureText: isObsecure,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                hintText: 'Re-Password',
                                hintStyle:
                                    const TextStyle(color: Color(0xff8F8989)),
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  icon: Icon(isObsecure
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      isObsecure = !isObsecure;
                                    });
                                  },
                                )),
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () async {
                            try {
                              if (_formKey.currentState!.validate()) {
                                int response = await Userservices().createUser(
                                    _nameController.text,
                                    _emailController.text,
                                    _passwordController.text,
                                    _phoneController.text);
                                log(response.toString());
                                if (response == 201) {
                                  setState(() {});
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'User created successfully!')));
                                } else if (response == 409) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'User with this email already exists')));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Oops! Somthing went wrong!')));
                                }
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'Oops! Somthing went wrong! $e')));
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 20),
                            height: 42,
                            decoration: BoxDecoration(
                                color: const Color(0xffC34C00),
                                borderRadius: BorderRadius.circular(6)),
                            child: const Padding(
                              padding: EdgeInsets.only(top: 12, bottom: 10),
                              child: Center(
                                child: Text(
                                    textAlign: TextAlign.center,
                                    'Submit',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
