import 'package:care/models/models_export.dart';
import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  ReportForAdminModel rFA;


  ReportCard({required this.rFA});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print(rFA.appointmentid);
      },
      child: SizedBox(
        height: 190,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
             ListTile(
              leading: Icon(Icons.medical_services_outlined),
              title: Text('Doctor Name : ${rFA.doctorname}'),
            ),
             ListTile(
              leading: Icon(Icons.medical_information_outlined),
              title: Text('Report : ${rFA.report}'),
            ),
             ListTile(
              leading: Icon(Icons.date_range),
              title: Text('Appointment : ${rFA.appointmentid}'),
            ),
          ],
        ),
      ),
    );
  }
}
