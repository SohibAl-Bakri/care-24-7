import 'package:care/models/models_export.dart';
import 'package:flutter/material.dart';

class DoctorCardForAdmin extends StatelessWidget {
  DoctorModel dM;

  DoctorCardForAdmin({super.key, required this.dM});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        leading: const Icon(Icons.medical_services_outlined),
        title: Text(dM.username.toString()),
      ),
      ListTile(
        leading: const Icon(Icons.phone),
        title: Text(dM.userphonenumber.toString()),
      ),
      ListTile(
        leading: const Icon(Icons.co_present_outlined),
        title: Text(dM.specialization.toString()),
      ),
      ListTile(
        leading: const Icon(Icons.pending_actions_sharp),
        title: const Text('Pending Status '),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.edit_attributes_outlined,
                size: 30.0,
                color: Colors.brown[900],
              ),
              onPressed: () {
                DoctorModel.approveDoctor(
                    doctorid: dM.userid, context: context);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete_forever_outlined,
                size: 30.0,
                color: Colors.brown[900],
              ),
              onPressed: () {
                DoctorModel.deleteDoctor(doctorid: dM.userid, context: context);
              },
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ]);
  }
}
