import 'package:care/views/views_export.dart';
import 'package:care/models/doctor_appointment.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  DoctorAppointmentModel dA;

  AppointmentCard(this.dA, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        dA.username.toString(),
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      subtitle: Text(
        dA.userNum.toString(),
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.edit_attributes_outlined,
              size: 30.0,
              color: Colors.brown[900],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => History(
                    dA: dA,
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.delete_forever_outlined,
              size: 30.0,
              color: Colors.brown[900],
            ),
            onPressed: () {
              // Write your code here
            },
          ),
        ],
      ),
    );
  }
}
