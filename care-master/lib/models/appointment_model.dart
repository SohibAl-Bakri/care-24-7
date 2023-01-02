import 'dart:convert';
import 'package:care/config/config_export.dart';
import 'package:care/views/views_export.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
List<AppointmentForPatientModel> appointmentModelFromJson(String str) => List<AppointmentForPatientModel>.from(json.decode(str).map((x) => AppointmentForPatientModel.fromJson(x)));

class AppointmentForPatientModel {
  AppointmentForPatientModel({
    this.appointmentid,
    this.patientid,
    this.doctorid,
    this.reportdone,
    this.appointmentdone,
    this.feedbackdone,
    this.userid,
    this.username,
    this.useremail,
    this.userbloodtype,
    this.userage,
    this.specialization,
  });

  String? appointmentid;
  String? patientid;
  String? doctorid;
  String? reportdone;
  String? appointmentdone;
  String? feedbackdone;
  String? userid;
  String? username;
  String? useremail;
  String? userbloodtype;
  String? userage;
  String? specialization;

  static Future<List<AppointmentForPatientModel>> getAppointment() async {
    String uri = "${ServerInfo.getAppointmentForPatientURL}?patientid=${ServerInfo.user.userID}";
    var response = await get(Uri.parse(uri));
    var responseParse = json.decode(response.body) as List;
    return responseParse.map((e) => AppointmentForPatientModel.fromJson(e)).toList();
  }

  static uploadFeedback(
      {required feedback,required appointmentID,required doctorID, required BuildContext context}) async {
    var data = {
      "appointmentid": appointmentID.toString(),
      "patientid": ServerInfo.user.userID.toString(),
      "doctorid": doctorID.toString(),
      "feedback": feedback,
    };
    var response =
    await post(Uri.parse(ServerInfo.uploadFeedbackURL), body: data);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        "feedback sent!",
      ),
    ));
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, PatientHistory.id);
  }

  factory AppointmentForPatientModel.fromJson(Map<String, dynamic> json) => AppointmentForPatientModel(
    appointmentid: json["appointmentid"].toString(),
    patientid: json["patientid"].toString(),
    doctorid: json["Doctorid"].toString(),
    reportdone: json["Reportdone"].toString(),
    appointmentdone: json["Appointmentdone"].toString(),
    feedbackdone: json["Feedbackdone"].toString(),
    userid: json["userid"].toString(),
    username: json["username"].toString(),
    useremail: json["useremail"].toString(),
    userbloodtype: json["userbloodtype"].toString(),
    userage: json["userage"].toString(),
    specialization: json["specialization"].toString(),
  );
}
