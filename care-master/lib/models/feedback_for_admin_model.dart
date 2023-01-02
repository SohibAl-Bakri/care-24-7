import 'dart:convert';

import 'package:care/config/config_export.dart';
import 'package:http/http.dart';
List<FeedbackForAdminModel> getFeedbackForAdminFromJson(String str) => List<FeedbackForAdminModel>.from(json.decode(str).map((x) => FeedbackForAdminModel.fromJson(x)));
class FeedbackForAdminModel {
  FeedbackForAdminModel({
    required this.appointmentid,
    required this.patientid,
    required this.doctorid,
    required this.feedbackid,
    required this.reportdone,
    required this.appointmentdone,
    required this.feedbackdone,
    required this.Feedbackid,
    required this.feedback,
    required this.doctorname,
    required this.doctoremail,
    required this.doctorbloodtype,
    required this.doctorphonenumber,
    required this.doctorage,
    required this.specialization,
    required this.patientname,
    required this.patientemail,
    required this.patientbloodtype,
    required this.patientphonenumber,
    required this.patientage,
  });

  String appointmentid;
  String patientid;
  String doctorid;
  String feedbackid;
  String reportdone;
  String appointmentdone;
  String feedbackdone;
  String Feedbackid;
  String feedback;
  String doctorname;
  String doctoremail;
  String doctorbloodtype;
  String doctorphonenumber;
  String doctorage;
  String specialization;
  String patientname;
  String patientemail;
  String patientbloodtype;
  String patientphonenumber;
  String patientage;

  factory FeedbackForAdminModel.fromJson(Map<String, dynamic> json) => FeedbackForAdminModel(
    appointmentid: json["appointmentid"].toString(),
    patientid: json["patientid"],
    doctorid: json["Doctorid"],
    feedbackid: json["Feedbackid"],
    reportdone: json["Reportdone"],
    appointmentdone: json["Appointmentdone"],
    feedbackdone: json["Feedbackdone"],
    Feedbackid: json["feedbackid"] == null ? "no feedback was given" : json["feedbackid"].toString(),
    feedback: json["feedback"] == null ? "no feedback was given" : json["feedback"].toString(),
    doctorname: json["doctorname"],
    doctoremail: json["doctoremail"],
    doctorbloodtype: json["doctorbloodtype"],
    doctorphonenumber: json["doctorphonenumber"],
    doctorage: json["doctorage"],
    specialization: json["specialization"],
    patientname: json["patientname"],
    patientemail: json["patientemail"],
    patientbloodtype: json["patientbloodtype"],
    patientphonenumber: json["patientphonenumber"],
    patientage: json["patientage"],
  );

  static Future<List<FeedbackForAdminModel>> getFeedback() async {
    String uri = ServerInfo.getFeedbackForAdminURL;
    var response = await get(Uri.parse(uri));
    print(response.statusCode);
    var responseParse = json.decode(response.body) as List;
    return responseParse.map((e) => FeedbackForAdminModel.fromJson(e)).toList();
  }
}
