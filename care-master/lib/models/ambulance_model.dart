import 'dart:convert';
import 'package:care/config/config_export.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

List<AmbulanceModel> ambulanceModelFromJson(String str) =>
    List<AmbulanceModel>.from(
        json.decode(str).map((x) => AmbulanceModel.fromJson(x)));


class AmbulanceModel {
  String ambulanceid;
  String patientid;
  String ambulancedone;
  String userid;
  String username;
  String useremail;
  String userbloodtype;
  String userphonenumber;
  String userage;


  AmbulanceModel(
      {required this.ambulanceid,
        required this.patientid,
        required this.userid,
        required this.ambulancedone,
        required this.username,
        required this.useremail,
        required this.userbloodtype,
        required this.userphonenumber,
        required this.userage});

  static askingForAmbulance({required context}) async {
    var data = {
      "patientid": ServerInfo.user.userID,
      "phonenumber": ServerInfo.user.userPhoneNumber,
    };
    var response = await post(
        Uri.parse(ServerInfo.askForAmbulanceURL), body: data);
    if (response.statusCode == 200) {
      var responsePare = jsonDecode(response.body);
      if (responsePare[0]["sent"] == "1") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "your order has been sent",
            ),
          ),
        );
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

  static Future<List<AmbulanceModel>> getAmbulance() async {
    String uri = ServerInfo.getAmbulanceOrderURL;
    var response = await get(Uri.parse(uri));
    var responseParse = json.decode(response.body) as List;
    return responseParse.map((e) => AmbulanceModel.fromJson(e)).toList();
  }

  static endAmbulanceOrder({required context,required AmbulanceModel aM}) async {
    var data = {
      "ambulanceid": aM.ambulanceid,
    };
    var response = await post(
        Uri.parse(ServerInfo.endAmbulanceOrderURL), body: data);
    print(response.statusCode);
    if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "the order has been ended",
            ),
          ),
        );
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

  factory AmbulanceModel.fromJson(Map<String, dynamic> json) =>
      AmbulanceModel(
        ambulanceid: json["ambulanceid"].toString(),
        patientid: json["patientid"].toString(),
        userid: json["userid"].toString(),
        ambulancedone: json["ambulancedone"],
        username: json["username"].toString(),
        useremail: json["useremail"].toString(),
        userbloodtype: json["userbloodtype"].toString(),
        userphonenumber: json["phonenumber"].toString(),
        userage: json["userage"].toString(),
      );

}