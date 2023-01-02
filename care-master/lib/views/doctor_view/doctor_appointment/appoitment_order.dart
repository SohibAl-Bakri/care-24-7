import 'package:care/cards/appointment_card.dart';
import 'package:care/config/config_export.dart';
import 'package:care/models/doctor_appointment.dart';
import 'package:flutter/material.dart';

class DoctorOrders extends StatefulWidget {
  const DoctorOrders({Key? key}) : super(key: key);

  @override
  State<DoctorOrders> createState() => _DoctorOrdersState();
}

class _DoctorOrdersState extends State<DoctorOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Column(
        children: [
          const Text('Orders',
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 10),
          doctorsAppointment(),
        ],
      ),
    );
  }
  Widget doctorsAppointment(){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height *0.6,
      child: FutureBuilder<List<DoctorAppointmentModel>>(
        future: DoctorAppointmentModel.getAppointment(ServerInfo.user.userID),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<DoctorAppointmentModel> doctorModelList =
              snapshot.data as List<DoctorAppointmentModel>;
              List<AppointmentCard> appointmentCard = [];
              for (var i in doctorModelList) {
                appointmentCard.add(AppointmentCard(i));
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
