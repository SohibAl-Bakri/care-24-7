import 'dart:convert';

import 'package:care/config/config_export.dart';
import 'package:care/models/appointment_model.dart';
import 'package:care/models/report_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ReportScreen extends StatefulWidget {
  AppointmentForPatientModel aFP;
  ReportScreen({required this.aFP, Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  ReportModel reportModel = ReportModel();
  getReport() async {
    String uri = ServerInfo.getReportURL +
        "?appointmentid=" +
        widget.aFP.appointmentid.toString();
    print(uri);
    var response = await get(Uri.parse(uri));
    var responsePare = jsonDecode(response.body);
    setState(() {
      reportModel = ReportModel.fromJson(responsePare);
    });
  }

  @override
  void initState() {
    getReport();
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
        body: Center(
          child: SizedBox(
            child: Text(
              reportModel.report.toString(),
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
