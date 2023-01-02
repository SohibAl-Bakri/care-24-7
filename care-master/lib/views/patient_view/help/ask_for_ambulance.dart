import 'package:care/models/models_export.dart';
import 'package:flutter/material.dart';

class AskForAmbulance extends StatefulWidget {
  const AskForAmbulance({Key? key}) : super(key: key);
  static String id = "afa";

  @override
  State<AskForAmbulance> createState() => _AskForAmbulanceState();
}

class _AskForAmbulanceState extends State<AskForAmbulance> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  AmbulanceModel.askingForAmbulance(context: context);
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                ),
                child: const Text(
                  "Ask For Ambulance",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
