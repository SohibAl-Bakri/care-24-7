import 'dart:convert';
import 'package:care/config/config_export.dart';
import 'package:care/views/views_export.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

List<DoctorAppointmentModel> appointmentModelFromJson(String str) =>
    List<DoctorAppointmentModel>.from(
        json.decode(str).map((x) => DoctorAppointmentModel.fromJson(x)));

class DoctorAppointmentModel {
  DoctorAppointmentModel({
    this.appointmentid,
    this.patientid,
    this.doctorid,
    this.feedbackid,
    this.reportdone,
    this.appointmentdone,
    this.feedbackdone,
    this.userid,
    this.username,
    this.userNum,
    this.specialization,
    this.useremail,
    this.userbloodtype,
    this.userage,
  });

  String? appointmentid;
  String? patientid;
  String? doctorid;
  String? feedbackid;
  String? reportdone;
  String? appointmentdone;
  String? feedbackdone;
  String? userid;
  String? username;
  String? userNum;
  String? specialization;
  String? useremail;
  String? userbloodtype;
  String? userage;

  static finishAppointmentAndSendReport({
    required DoctorAppointmentModel dA,
    required report,
    required BuildContext context,
  }) async {
    var data = {
      "appointmentid": dA.appointmentid,
      "doctorid": dA.doctorid,
      "patientid": dA.patientid,
      "report": report,
    };
    var response = await post(Uri.parse(ServerInfo.sendReport), body: data);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "sendReport ",
          ),
        ),
      );
      Navigator.pushNamedAndRemoveUntil(
          context, DoctorHome.id, (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Network error",
          ),
        ),
      );
    }
  }

  /*static sendReport({
    required DoctorAppointmentModel dA,
    required report,
    required BuildContext context,
  }) async {
      var data = {
        "appointmentid": dA.appointmentid,
        "doctorid": dA.doctorid,
        "patientid": dA.patientid,
        "report": report,
      };
      var response = await post(Uri.parse(ServerInfo.sendReport), body: data);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Report sent!",
            ),
          ),
        );
        Navigator.pushNamedAndRemoveUntil(context, DoctorHome.id, (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Network error",
            ),
          ),
        );
    }
  }*/

  /*static takeAppointment(
      {required String doctorID,
      required appointmentid,
      required BuildContext context}) async {
    var data = {
      "appointmentid": appointmentid,
      "Doctorid": doctorID,
    };
    var response =
        await post(Uri.parse(ServerInfo.acceptAppointment), body: data);
    if (response.statusCode == 200) {
      var responsePare = jsonDecode(response.body);
      if (responsePare[0]["sent"] == "1") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
            ""
            ),
          ),
        );
        Navigator.pushNamedAndRemoveUntil(context, Home.id, (route) => false);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Network error",
          ),
        ),
      );
    }
  }
*/
  static setDoctorAppointment(
      {required String doctorID, required BuildContext context}) async {
    var data = {
      "patientid": ServerInfo.user.userID,
      "Doctorid": doctorID,
    };
    var response =
        await post(Uri.parse(ServerInfo.setDoctorAppointmentURL), body: data);
    if (response.statusCode == 200) {
      var responsePare = jsonDecode(response.body);
      if (responsePare[0]["sent"] == "1") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "your appointment has been set id the doctor did not contact you in few minutes choose another doctor",
            ),
          ),
        );
        Navigator.pushNamedAndRemoveUntil(context, Home.id, (route) => false);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Network error",
          ),
        ),
      );
    }
  }

  static Future<List<DoctorAppointmentModel>> getAppointment(doctorID) async {
    String uri = "${ServerInfo.getAppointmentURL}?Doctorid=$doctorID";
    var response = await get(Uri.parse(uri));
    var responseParse = json.decode(response.body) as List;
    return responseParse
        .map((e) => DoctorAppointmentModel.fromJson(e))
        .toList();
  }

  factory DoctorAppointmentModel.fromJson(Map<String, dynamic> json) =>
      DoctorAppointmentModel(
        appointmentid: json["appointmentid"].toString(),
        patientid: json["patientid"].toString(),
        doctorid: json["Doctorid"].toString(),
        feedbackid: json["Feedbackid"].toString(),
        reportdone: json["Reportdone"].toString(),
        appointmentdone: json["Appointmentdone"].toString(),
        feedbackdone: json["Feedbackdone"].toString(),
        userid: json["userid"].toString(),
        username: json["username"].toString(),
        userNum: json["userphonenumber"].toString(),
        specialization: json["specialization"].toString(),
        useremail: json["useremail"].toString(),
        userbloodtype: json["userbloodtype"].toString(),
        userage: json["userage"].toString(),
      );
}
