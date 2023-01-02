import 'package:care/cards/cards_export.dart';
import 'package:care/models/models_export.dart';
import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          title: const Text('Doctor Reports',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              getReport(),
            ],
          ),
        ));
  }
  Widget getReport(){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height-40,
      child: FutureBuilder<List<ReportForAdminModel>>(
        future: ReportForAdminModel.getReport(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<ReportForAdminModel> ambulanceModelList =
              snapshot.data as List<ReportForAdminModel>;
              List<ReportCard> reportCard = [];
              for (var i in ambulanceModelList) {
                reportCard.add(ReportCard(rFA: i));
              }
              return ListView(
                children: reportCard,
              );
            } else {
              return const CircularProgressIndicator();
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
