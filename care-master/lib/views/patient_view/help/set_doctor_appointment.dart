import 'package:care/models/doctor_appointment.dart';
import 'package:care/models/models_export.dart';
import 'package:flutter/material.dart';

class SetDoctorAppointment extends StatelessWidget {
  DoctorModel doctorInfo;
  SetDoctorAppointment({super.key, required this.doctorInfo});
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Padding(
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
                        Text(doctorInfo.username.toString()),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Row(
                      children: [
                        const Text('Dr. Phone : '),
                        Text(doctorInfo.userphonenumber.toString()),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Row(
                      children: [
                        const Text('Dr. E-Mail : '),
                        Text(doctorInfo.useremail.toString()),
                      ],
                    ),
                  ),

                  //Text(doctorInfo.userid.toString()),

                  //Text(doctorInfo.userbloodtype.toString()),
                  //Text(doctorInfo.userage.toString()),
                  //Text(doctorInfo.userkind.toString()),
                  const SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: () {
                        DoctorAppointmentModel.setDoctorAppointment(
                            doctorID: doctorInfo.userid.toString(),
                            context: context);
                      },
                      child: const Text("set appointment with doctor")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
