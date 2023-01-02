import 'package:care/models/models_export.dart';
import 'package:care/views/patient_view/history/report.dart';
import 'package:care/views/views_export.dart';
import 'package:flutter/material.dart';

class AppointmentCardForPatient extends StatelessWidget {
  AppointmentForPatientModel aFP;

  AppointmentCardForPatient(this.aFP, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Card(
        child: SizedBox(
          width: double.infinity,
          height: 150,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  children: [
                    const Text('Dr. Name : '),
                    Text(aFP.username.toString()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  children: [
                    const Text('Dr. Specialization : '),
                    Text(aFP.specialization.toString()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  children: [
                    const Text('Appointment Status : '),
                    Text(aFP.appointmentdone == "0" ? "Not Done" : "Done"),
                  ],
                ),
              ),
              const SizedBox(height: 15),

              //Text(aFP.appointmentid.toString()),
              //Text(aFP.feedbackdone.toString()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Visibility(
                    visible: aFP.reportdone == "1",
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReportScreen(aFP: aFP),
                            ));
                      },
                      child: const Text("View Report"),
                    ),
                  ),
                  Visibility(
                    visible:
                        aFP.appointmentdone == "1" && aFP.feedbackdone == "0",
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FeedbackScreen(aFP),
                            ));
                      },
                      child: const Text("Giv Feedback"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
