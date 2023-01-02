import 'package:care/config/config_export.dart';
import 'package:care/views/views_export.dart';
import 'package:flutter/material.dart';

class Medical extends StatefulWidget {
  const Medical({Key? key}) : super(key: key);

  @override
  State<Medical> createState() => _MedicalState();
}

class _MedicalState extends State<Medical> {
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
            child: Column(
              children: [
                const Text('Medical Id',
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
                    enabled: false,
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
                    enabled: false,
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
                    enabled: false,
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
                        label: Text(ServerInfo.user.userAge,
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
                    enabled: false,
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
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, PatientHistory.id);
                  },
                  child: SizedBox(
                    width: 180,
                    child: TextFormField(
                      enabled: false,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          filled: true,
                          label: Text('History',
                              style: TextStyle(color: Colors.black)),
                          fillColor: Colors.grey,
                          border: OutlineInputBorder()),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
