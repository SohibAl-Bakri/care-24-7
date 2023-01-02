import 'package:care/main.dart';
import 'package:care/views/views_export.dart';
import 'package:flutter/material.dart';
Map<String ,Widget Function(BuildContext)> routes = {
  Splash.id : (context) => const Splash(),
  Login.id : (context) => const Login(),
  Signup.id : (context) => const Signup(),
  Home.id : (context) => const Home(),
  AskForAmbulance.id : (context) => const AskForAmbulance(),
  SetAppointment.id : (context) => const SetAppointment(),
  DoctorHome.id : (context) => const DoctorHome(),
  PatientHistory.id : (context) => const PatientHistory(),
  AdminHome.id : (context) => AdminHome(),

} ;