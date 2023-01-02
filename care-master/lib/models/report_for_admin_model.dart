import 'dart:convert';

import 'package:care/config/server_info.dart';
import 'package:http/http.dart';
List<ReportForAdminModel> reportForAdminFromJson(String str) => List<ReportForAdminModel>.from(json.decode(str).map((x) => ReportForAdminModel.fromJson(x)));
class ReportForAdminModel {
  ReportForAdminModel({
    required this.appointmentid,
    required this.patientid,
    required this.doctorid,
    required this.feedbackid,
    required this.reportdone,
    required this.appointmentdone,
    required this.feedbackdone,
    required this.reportid,
    required this.report,
    required this.doctorname,
    required this.doctoremail,
    required this.doctorbloodtype,
    required this.doctorphonenumber,
    required this.doctorage,
    required this.specialization,
  });

  String appointmentid;
  String patientid;
  String doctorid;
  String feedbackid;
  String reportdone;
  String appointmentdone;
  String feedbackdone;
  String reportid;
  String report;
  String doctorname;
  String doctoremail;
  String doctorbloodtype;
  String doctorphonenumber;
  String doctorage;
  String specialization;

  static Future<List<ReportForAdminModel>> getReport() async {
    String uri = ServerInfo.getReportForAdminURL;
    var response = await get(Uri.parse(uri));
    var responseParse = json.decode(response.body) as List;
    return responseParse.map((e) => ReportForAdminModel.fromJson(e)).toList();
  }

  factory ReportForAdminModel.fromJson(Map<String, dynamic> json) =>
      ReportForAdminModel(
        appointmentid: json["appointmentid"].toString(),
        patientid: json["patientid"],
        doctorid: json["Doctorid"],
        feedbackid: json["Feedbackid"],
        reportdone: json["Reportdone"],
        appointmentdone: json["Appointmentdone"],
        feedbackdone: json["Feedbackdone"],
        reportid: json["reportid"] == null ? "got no report" : json["reportid"].toString(),
        report:  json["report"] ?? "got no report",
        doctorname: json["doctorname"],
        doctoremail: json["doctoremail"],
        doctorbloodtype: json["doctorbloodtype"],
        doctorphonenumber: json["doctorphonenumber"],
        doctorage: json["doctorage"],
        specialization: json["specialization"],
      );
}