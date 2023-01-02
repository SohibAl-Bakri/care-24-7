import 'package:care/models/models_export.dart';
import 'package:flutter/material.dart';
class FeedbackForAdminCard extends StatelessWidget {
  FeedbackForAdminModel  fFA;
  FeedbackForAdminCard({required this.fFA});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        children: [
          ListTile(
           leading: const Icon(Icons.co_present_outlined),
           title: Text('Patient Name : ${fFA.patientname}'),
            ),
          ListTile(
           leading: const Icon(Icons.medical_services_outlined),
           title: Text('Doctor Name : ${fFA.doctorname}'),
            ),
          ListTile(
           leading: const Icon(Icons.date_range),
           title: Text('Appointment : ${fFA.appointmentid}'),
            ),
          ListTile(
           leading:const  Icon(Icons.feedback_outlined),
           title: Text('Feedback : ${fFA.feedback}'),
            ),
        ],
      ),
    );
  }
}
