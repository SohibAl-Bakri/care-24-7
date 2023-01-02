import 'package:care/cards/cards_export.dart';
import 'package:care/models/models_export.dart';
import 'package:flutter/material.dart';

class SetAppointment extends StatefulWidget {
  const SetAppointment({Key? key}) : super(key: key);
  static String id = "SetAppointment";

  @override
  State<SetAppointment> createState() => _SetAppointmentState();
}

class _SetAppointmentState extends State<SetAppointment> {
  List<String> specializationItems = ["select doctor specialization"];
  String dropdownValue = "select doctor specialization";

  getSpecializationItems() {
    //List <String> items =[];
    DoctorModel().getSpecialization().then((value) {
      setState(() {
        specializationItems.addAll(value);
      });
    });
  }

  @override
  void initState() {
    getSpecializationItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              DropdownButton(
                value: dropdownValue,
                items: specializationItems.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value.toString();
                  });
                },
              ),
              const SizedBox(
                height: 15,
              ),
              doctors(dropdownValue),
            ],
          ),
        ),
      ),
    ));
  }

  Widget doctors(specialization) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: FutureBuilder<List<DoctorModel>>(
        future: DoctorModel().getDoctors(specialization),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<DoctorModel> doctorModelList =
                  snapshot.data as List<DoctorModel>;
              List<DoctorCard> doctorCard = [];
              for (var i in doctorModelList) {
                doctorCard.add(DoctorCard(i));
              }
              return ListView(
                children: doctorCard,
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
