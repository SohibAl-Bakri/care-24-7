import 'package:flutter/material.dart';
import 'package:care/doctor.dart';

class Approve extends StatefulWidget {
  const Approve({Key? key}) : super(key: key);

  @override
  State<Approve> createState() => _ApproveState();
}

class _ApproveState extends State<Approve> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
        ),
        body: Center(
          child: Column(children: [
            const SizedBox(
              height: 200,
            ),
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/7542/7542245.png',
              width: 130,
              height: 130,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Hello please wait until the admin approve you',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                )),
            const SizedBox(height: 10),
            SizedBox(
                height: 80,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Doctor(),
                        ));
                  },
                  child: const Text('Next',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      )),
                ))
          ]),
        ));
  }
}
