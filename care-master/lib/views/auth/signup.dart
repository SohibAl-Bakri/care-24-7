// ignore_for_file: body_might_complete_normally_nullable

import 'dart:core';
import 'package:care/config/config_export.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  static String id = "Signup";

  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _Signup();
}

class _Signup extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullName = TextEditingController();
  TextEditingController bloodType = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController userAge = TextEditingController();
  TextEditingController specialization = TextEditingController();
  String dOrPFlag = "";
  bool passMessage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          leading: InkWell(onTap: () {
            Navigator.pop(context);

            const Icon(
              Icons.arrow_back,
              color: Colors.black,
            );
          }),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Column(children: [
            const Text('Create Your Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25,
                  letterSpacing: 2,
                )),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 220,
              child: TextFormField(
                controller: fullName,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  filled: true,
                  label:
                      Text('Full Name', style: TextStyle(color: Colors.black)),
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '* Enter Your Name';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 220,
              child: TextFormField(
                controller: bloodType,
                decoration: const InputDecoration(
                  filled: true,
                  label:
                      Text('Blood Type', style: TextStyle(color: Colors.black)),
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '* Enter Blood Type';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 220,
              child: TextFormField(
                controller: emailAddress,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  filled: true,
                  label: Text('E-mail Address',
                      style: TextStyle(color: Colors.black)),
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '* Enter Your Email';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 220,
              child: TextFormField(
                controller: password,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true,
                  label:
                      Text('Password', style: TextStyle(color: Colors.black)),
                  border: OutlineInputBorder(),
                  fillColor: Colors.grey,
                ),
                validator: (value) {
                  RegExp regex = RegExp(
                    r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                  );
                  if (value == null || value.isEmpty) {
                    return '* Enter Password';
                  } else {
                    if (!regex.hasMatch(value)) {
                      setState(() {
                        passMessage = true;
                      });
                    } else {
                      // setState(() {
                      //   passMessage = false;
                      // });
                      return null;
                    }
                  }

                  // if (value == null || value.isEmpty) {
                  //   return '* Enter Password';
                  // }
                  // if (value.length <= 8) {
                  //   return '* Enter at least 8 character';
                  // }

                  // if (value.length <= 8) {
                  //   return '* Enter at least 8 character';
                  // }
                  // // elseif(value.length <=6){
                  // //   return 'At least 6 characters';
                  // // }
                  // return null;
                },
              ),
            ),
            Visibility(
              visible: passMessage,
              child: const SizedBox(
                width: 220,
                child: Text(
                  '* The password must contain letter,number and special character and at least 8 diget',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 220,
              child: TextFormField(
                controller: userAge,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  filled: true,
                  label: Text('Age', style: TextStyle(color: Colors.black)),
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '* Enter Your Age';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 220,
              child: TextFormField(
                controller: phoneNumber,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  filled: true,
                  label: Text('Phone Number',
                      style: TextStyle(color: Colors.black)),
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '* Enter Your Phone Number';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Visibility(
              visible: dOrPFlag == "1",
              child: SizedBox(
                width: 220,
                child: TextFormField(
                  controller: specialization,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    label: Text('Specialization',
                        style: TextStyle(color: Colors.black)),
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '* Enter Your Specialization';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Are you a doctor or a patient?',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: RadioListTile(
                    activeColor: Colors.grey,
                    value: "1",
                    groupValue: dOrPFlag,
                    onChanged: (value) {
                      setState(() {
                        dOrPFlag = value.toString();
                      });
                    },
                    title: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Image.network(
                              'https://cdn-icons-png.flaticon.com/512/921/921059.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.fill,
                            ),
                            const Text(
                              'Doctor',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RadioListTile(
                    activeColor: Colors.grey,
                    value: "0",
                    groupValue: dOrPFlag,
                    onChanged: (value) {
                      setState(() {
                        dOrPFlag = value.toString();
                      });
                    },
                    title: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Image.network(
                              'https://cdn-icons-png.flaticon.com/512/2302/2302715.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.fill,
                            ),
                            const Text(
                              'Patient',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 40,
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ServerInfo.user.signup(
                      fullName: fullName.text,
                      bloodType: bloodType.text,
                      email: emailAddress.text,
                      password: password.text,
                      phoneNumber: phoneNumber.text,
                      dOrPFlag: dOrPFlag,
                      context: context,
                      userAge: userAge.text,
                      specialization:
                          dOrPFlag == "0" ? "" : specialization.text,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text('Regsister',
                    style: TextStyle(
                      color: Colors.black,
                    )),
              ),
            ),
          ])),
        ));
  }
}
