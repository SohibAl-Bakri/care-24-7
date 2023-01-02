import 'package:flutter/material.dart';
import 'package:care/views/views_export.dart';

class Doctor extends StatefulWidget {
  const Doctor({Key? key}) : super(key: key);

  @override
  State<Doctor> createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        /*leading: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => dochome()));
          },
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ),*/
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 150,
          ),
          const Text('Please enter your specialization',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              )),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 250,
            height: 80,
            child: TextFormField(
              decoration: const InputDecoration(
                  filled: true,
                  label: Text('write here...',
                      style: TextStyle(color: Colors.black, fontSize: 25)),
                  fillColor: Colors.grey,
                  border: OutlineInputBorder()),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 40,
            width: 120,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DoctorHome(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text('Submit',
                  style: TextStyle(color: Colors.black, fontSize: 25)),
            ),
          ),
        ]),
      ),
    );
  }
}
