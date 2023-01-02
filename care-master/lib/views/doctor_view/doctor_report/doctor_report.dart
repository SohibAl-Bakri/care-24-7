import 'package:care/models/doctor_appointment.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  DoctorAppointmentModel dA;

  History({super.key, required this.dA});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  TextEditingController report = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 25),
            const Text('Tell us about the patient as a report of the service',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
            const SizedBox(height: 15),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: 350,
                child: TextField(
                  controller: report,
                  maxLines: 5,
                  style: const TextStyle(height: 2.0),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      //contentPadding: EdgeInsets.symmetric(vertical: 80.0),
                      hintText: 'Write here'),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
                height: 80,
                width: 250,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: const BeveledRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                    onPressed: () {
                      DoctorAppointmentModel.finishAppointmentAndSendReport(
                          dA: widget.dA, report: report.text, context: context);
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ))),
          ]),
        ),
      ),
    );
  }
}
