import 'dart:convert';
import 'package:care/views/admin_view/admin_home/admin_home.dart';
import 'package:care/config/config_export.dart';
import 'package:care/views/views_export.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserModel {
  String userID;
  String userName;
  String userEmail;
  String userKind;
  String userPhoneNumber;
  String userBloodType;
  String doctorApproved;
  String specialization;
  String userAge;
  UserModel(
      {required this.userID,
      required this.userName,
      required this.userEmail,
      required this.userKind,
      required this.userPhoneNumber,
      required this.doctorApproved,
      required this.userBloodType,
      required this.userAge,
      required this.specialization,
      });

  Future login({required context,required email, required password}) async {
    var request = {
      "useremail": email,
      "userpassword": password,
    };
    var response = await post(Uri.parse(ServerInfo.loginURL), body: request);
    if (response.statusCode == 200) {
      var responseParse = await jsonDecode(response.body);
      if (responseParse[0]["userid"].toString() != "0"){
        if(responseParse[0]["userkind"]=="0"){
          //Patient
          setValues(responseParse: responseParse, context: context, rootName: Home.id);
        }else if(responseParse[0]["userkind"]=="1"){
          //doctor
          if(responseParse[0]["doctorabroved"]=="1"){
            //approved doctor
            setValues(responseParse: responseParse, context: context, rootName: DoctorHome.id);
          }else{
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "you are not approved yet please wait tell the admin to approve you!",
                ),
              ),
            );
          }
        }else if(responseParse[0]["userkind"]=="2"){
          //admin
          setValues(responseParse: responseParse, context: context, rootName: AdminHome.id);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "wrong username or wrong password",
            ),
          ),
        );
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              "Network error",
          ),
        ),
      );
    }
  }

  setValues({required responseParse,required context,required rootName}){
    userID = responseParse[0]["userid"].toString();
    userName = responseParse[0]["username"];
    userEmail = responseParse[0]["useremail"];
    userKind = responseParse[0]["userkind"].toString();
    userPhoneNumber = responseParse[0]["userphonenumber"].toString();
    userBloodType = responseParse[0]["userbloodtype"].toString();
    doctorApproved = responseParse[0]["doctorapproved"].toString();
    specialization = responseParse[0]["specialization"].toString();
    userAge = responseParse[0]["userage"].toString();
    saveUserInfoIntoSharedPreferences();
    Navigator.pushNamedAndRemoveUntil(context, rootName, (route) => false);
  }

  signup({required fullName,required bloodType,required email,required password,required phoneNumber,required dOrPFlag,required context,required userAge,required specialization})async{
    var data = {
      "username" : fullName,
      "useremail" : email ,
      "userpassword" : password,
      "userbloodtype" : bloodType,
      "userphonenumber" : phoneNumber,
      "userkind" : dOrPFlag,
      "specialization" : specialization,
      "userage" : userAge,
    };
    var response = await post(Uri.parse(ServerInfo.signUpURL),body: data);
    if(response.statusCode==200){
      var responseParse = jsonDecode(response.body);
      if(responseParse[0]["userid"]!="0"){
        await login(context: context, email: email, password: password);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "email already exists",
            ),
          ),
        );
      }
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Network error",
          ),
        ),
      );
    }
  }

  logout({required context})async{
    clearUserInfoFromSharedPreferences();
    Navigator.pushNamedAndRemoveUntil(context, Login.id, (route) => false);
  }

  void saveUserInfoIntoSharedPreferences() async {
    var sp = await SharedPreferences.getInstance();
    sp.setString("logged", "1");
    sp.setString("userid", userID);
    sp.setString("username", userName);
    sp.setString("useremail", userEmail);
    sp.setString("userkind", userKind);
    sp.setString("userphonenumber", userPhoneNumber);
    sp.setString("userbloodtype", userBloodType);
    sp.setString("doctorapproved", doctorApproved);
    sp.setString("userage", userAge);
    sp.setString("specialization", specialization);
  }

   retrieveInfoFromSharedPreferences() async {
    var sp = await SharedPreferences.getInstance();
    userID = sp.getString("userid") ?? "0";
    userName = sp.getString("username") ?? "";
    userEmail = sp.getString("useremail") ?? "";
    userKind = sp.getString("userkind") ?? "";
    userPhoneNumber = sp.getString("userphonenumber") ?? "";
    userBloodType = sp.getString("userbloodtype") ?? "";
    doctorApproved = sp.getString("doctorapproved") ?? "";
    userAge = sp.getString("userage") ?? "";
    specialization = sp.getString("specialization") ?? "";
  }

  static clearUserInfoFromSharedPreferences() async {
    var sp = await SharedPreferences.getInstance();
    sp.remove("logged");
    sp.remove("userid");
    sp.remove("username");
    sp.remove("useremail");
    sp.remove("userkind");
    sp.remove("userphonenumber");
    sp.remove("userbloodtype");
    sp.remove("doctorapproved");
    sp.remove("userage");
    sp.remove("specialization");
  }
}