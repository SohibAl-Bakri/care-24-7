import 'dart:convert';
ReportModel reportModelFromJson(String str) => ReportModel.fromJson(json.decode(str));
class ReportModel {
  ReportModel({
    this.reportid,
    this.appointmentid,
    this.doctorid,
    this.patientid,
    this.report,
  });

  String? reportid;
  String? appointmentid;
  String? doctorid;
  String? patientid;
  String? report;

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
    reportid: json["reportid"].toString(),
    appointmentid: json["appointmentid"].toString(),
    doctorid: json["doctorid"].toString(),
    patientid: json["patientid"].toString(),
    report: json["report"].toString(),
  );
}
