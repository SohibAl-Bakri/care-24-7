import 'package:care/models/models_export.dart';
import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  AppointmentForPatientModel aFP;
  FeedbackScreen(this.aFP, {super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  TextEditingController feedback = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            elevation: 0,
            leading: BackButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                const Text('Rate Our Service',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
                const SizedBox(height: 15),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Tell us about your experience',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      //fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: 350,
                    child: TextField(
                      controller: feedback,
                      maxLines: 5,
                      style: const TextStyle(height: 2.0),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          //contentPadding: EdgeInsets.symmetric(vertical: 80.0),
                          hintText: 'Write here'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                    height: 80,
                    width: 250,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            shape: const BeveledRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))),
                        onPressed: () async {
                          AppointmentForPatientModel.uploadFeedback(feedback: feedback.text, appointmentID: widget.aFP.appointmentid, doctorID: widget.aFP.doctorid, context: context);
                        },
                        child: const Text(
                          'Send Message',
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ))),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  'Or contact us via',
                  style: TextStyle(fontSize: 28),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/5968/5968764.png',
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    CircleAvatar(
                        child: Image.network(
                            'https://cdn-icons-png.flaticon.com/512/3687/3687004.png')),
                    const SizedBox(
                      width: 20,
                    ),
                    CircleAvatar(
                      child: Image.network(
                          'https://cdn-icons-png.flaticon.com/512/7718/7718904.png'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
