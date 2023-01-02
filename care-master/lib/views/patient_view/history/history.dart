import 'package:care/cards/appointment_card_for_patient.dart';
import 'package:care/models/models_export.dart';
import 'package:flutter/material.dart';

class PatientHistory extends StatefulWidget {
  static String id = "PatientHistory";

  const PatientHistory({super.key});
  @override
  State<PatientHistory> createState() => _PatientHistoryState();
}

class _PatientHistoryState extends State<PatientHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
      ),
      body: history(),
    );
  }

  Widget history() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: FutureBuilder<List<AppointmentForPatientModel>>(
        future: AppointmentForPatientModel.getAppointment(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<AppointmentForPatientModel> appointmentModelList =
                  snapshot.data as List<AppointmentForPatientModel>;
              List<AppointmentCardForPatient> appointmentCard = [];
              for (var i in appointmentModelList) {
                appointmentCard.add(AppointmentCardForPatient(i));
              }
              return ListView(
                children: appointmentCard,
              );
            } else {
              return const Text("F");
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
