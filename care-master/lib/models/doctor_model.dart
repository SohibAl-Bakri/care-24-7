import 'dart:convert';
import 'package:care/config/config_export.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:care/views/admin_view/pending_doctors/pending.dart';

DoctorModel getDoctorModelFromJson(String str) =>
    DoctorModel.fromJson(json.decode(str));

class DoctorModel {
  DoctorModel({
    this.userid,
    this.username,
    this.useremail,
    this.userbloodtype,
    this.userphonenumber,
    this.userkind,
    this.doctorabroved,
    this.userage,
    this.status,
    this.specialization,
  });

  int? userid;
  String? username;
  String? useremail;
  String? userbloodtype;
  String? userphonenumber;
  String? userkind;
  String? doctorabroved;
  String? userage;
  String? status;
  String? specialization;

  static Future<List<DoctorModel>> getDoctorsForAdmin() async {
    String uri = ServerInfo.getDoctorsForAdminURL;
    var response = await get(Uri.parse(uri));
    var responseParse = json.decode(response.body) as List;
    return responseParse
        .map((e) => DoctorModel.fromJson(e))
        .toList();
  }

  Future<List<DoctorModel>> getDoctors(specialization) async {
    String uri =
        "${ServerInfo.getDoctorsURL}${specialization == "select doctor specialization" ? "?sp=selectdoctorspecialization" : "?sp=$specialization"}";
    var response = await get(Uri.parse(uri));
    var responseParse = json.decode(response.body) as List;
    return responseParse.map((e) => DoctorModel.fromJson(e)).toList();
  }

  Future<List<String>> getSpecialization() async {
    String uri = "${ServerInfo.getDoctorsURL}?sp=selectdoctorspecialization";
    List<String> specialization = [];
    var response = await get(Uri.parse(uri));
    var responseParse = json.decode(response.body);
    for (var i in responseParse) {
      specialization.add(i["specialization"]);
    }
    return specialization;
  }

  static deleteDoctor(
      {required doctorid, required BuildContext context}) async {
    var data = {
      "Doctorid": doctorid.toString(),
    };
    var response =
        await post(Uri.parse(ServerInfo.deleteDoctorURL), body: data);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        "doctor got deleted!",
      ),
    ));
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Pending(),
        ));
  }

  static approveDoctor(
      {required doctorid, required BuildContext context}) async {
    var data = {
      "Doctorid": doctorid.toString(),
    };
    var response =
        await post(Uri.parse(ServerInfo.approveDoctorURL), body: data);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        "doctor got approved!",
      ),
    ));
    Navigator.pop(context);
    /*Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Pending(),
        ));*/
  }

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        userid: json["userid"],
        username: json["username"],
        useremail: json["useremail"],
        userbloodtype: json["userbloodtype"],
        userphonenumber: json["userphonenumber"],
        userkind: json["userkind"],
        doctorabroved: json["doctorabroved"],
        userage: json["userage"],
        status: json["status"],
        specialization: json["specialization"],
      );
}
