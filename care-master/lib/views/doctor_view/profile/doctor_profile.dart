import 'package:care/config/config_export.dart';
import 'package:flutter/material.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({Key? key}) : super(key: key);

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              const Text('Profile',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 40)),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 180,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      filled: true,
                      label: Text(ServerInfo.user.userName,
                          style: const TextStyle(color: Colors.black)),
                      fillColor: Colors.grey,
                      border: const OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 180,
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      label: Text(ServerInfo.user.userBloodType,
                          style: const TextStyle(color: Colors.black)),
                      fillColor: Colors.grey,
                      border: const OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 180,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      filled: true,
                      label: Text(ServerInfo.user.userEmail,
                          style: const TextStyle(color: Colors.black)),
                      fillColor: Colors.grey,
                      border: const OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 180,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      filled: true,
                      label: Text(ServerInfo.user.userAge, style: const TextStyle(color: Colors.black)),
                      fillColor: Colors.grey,
                      border: const OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 180,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      filled: true,
                      label: Text(ServerInfo.user.userPhoneNumber,
                          style: const TextStyle(color: Colors.black)),
                      fillColor: Colors.grey,
                      border: const OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 180,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      filled: true,
                      label: Text(ServerInfo.user.specialization,
                          style: const TextStyle(color: Colors.black)),
                      fillColor: Colors.grey,
                      border: const OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              /*SizedBox(
                height: 60,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => adhome(),
                        ));
                  },
                  child: Text('Sign in',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      )),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),*/
            ]),
          ),
        ));
  }
}
