import 'package:care/views/views_export.dart';
import 'package:care/models/models_export.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  DoctorModel dM;

  DoctorCard(this.dM, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 37,
        color: dM.status == "0" ? Colors.white : Colors.red,
        child: InkWell(
          onTap: () {
            if (dM.status == "0") {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return SetDoctorAppointment(
                    doctorInfo: dM,
                  );
                },
              ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Doctor busy please choose another doctor or wait tell the doctor is available",
                  ),
                ),
              );
            }
          },
          child: Card(
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  dM.username.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  dM.specialization.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
