import 'package:care/config/config_export.dart';
import 'package:care/views/auth/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static String id = "Login";
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: [
          const Text('Login',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 40,
                letterSpacing: 2,
              )),
          const SizedBox(
            height: 40,
          ),
          Image.network(
            'https://cdn-icons-png.flaticon.com/512/2609/2609282.png',
            width: 120,
            height: 120,
          ),
          const SizedBox(
            height: 60,
          ),
          SizedBox(
            width: 350,
            child: TextFormField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.mail, color: Colors.black),
                  label: Text('Email Address',
                      style: TextStyle(color: Colors.black)),
                  fillColor: Colors.grey,
                  border: OutlineInputBorder()),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 350,
            child: TextFormField(
              controller: password,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: const InputDecoration(
                filled: true,
                prefixIcon: Icon(Icons.lock, color: Colors.black),
                label: Text('Password', style: TextStyle(color: Colors.black)),
                border: OutlineInputBorder(),
                fillColor: Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 40,
            width: 100,
            child: ElevatedButton(
              onPressed: () {
                ServerInfo.user.login(
                    context: context,
                    email: email.text,
                    password: password.text);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text('Login',
                  style: TextStyle(
                    color: Colors.black,
                  )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Need an account? ',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Signup()));
                },
                child: const Text(
                  'Signup',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
            ],
          ),
        ]))));
  }
}
