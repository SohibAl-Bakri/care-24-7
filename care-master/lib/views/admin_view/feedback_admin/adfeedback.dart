import 'package:care/cards/cards_export.dart';
import 'package:care/models/models_export.dart';
import 'package:flutter/material.dart';

class AdminFeedback extends StatefulWidget {
  const AdminFeedback({Key? key}) : super(key: key);

  @override
  State<AdminFeedback> createState() => _AdminFeedbackState();
}

class _AdminFeedbackState extends State<AdminFeedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text('Patients Feedback',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            getReport(),
          ],
        ),
      ),
    );
  }
  Widget getReport(){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: FutureBuilder<List<FeedbackForAdminModel>>(
        future: FeedbackForAdminModel.getFeedback(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<FeedbackForAdminModel> ambulanceModelList =
              snapshot.data as List<FeedbackForAdminModel>;
              List<FeedbackForAdminCard> reportCard = [];
              for (var i in ambulanceModelList) {
                reportCard.add(FeedbackForAdminCard(fFA: i));
              }
              return ListView(
                children: reportCard,
              );
            } else {
              return const CircularProgressIndicator();
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
