import 'package:care/cards/cards_export.dart';
import 'package:care/models/models_export.dart';
import 'package:flutter/material.dart';

class Pending extends StatefulWidget {
  const Pending({Key? key}) : super(key: key);

  @override
  State<Pending> createState() => _PendingState();
}

class _PendingState extends State<Pending> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
        ),
          body: SingleChildScrollView(
            child: Column(children: [
              const Text('Pending Orders for Doctors',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 40)),
              const SizedBox(
                height: 50,
              ),
              doctors(),
            ]),
          ));
  }
  Widget doctors(){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: FutureBuilder<List<DoctorModel>>(
        future: DoctorModel.getDoctorsForAdmin(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<DoctorModel> doctorModelList =
              snapshot.data as List<DoctorModel>;
              List<DoctorCardForAdmin> doctorCard = [];
              for (var i in doctorModelList) {
                doctorCard.add(DoctorCardForAdmin(dM:i));
              }
              return ListView(
                children: doctorCard,
              );
            } else if(snapshot.connectionState == ConnectionState.done && (!snapshot.hasData)){
              return const Text("No doctors to approve");
            }else{
              return const Text("No doctors to approve");
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("No doctors to approve");
          } else {
            return const CircularProgressIndicator();
          }

        },
      ),
    );
  }
}
