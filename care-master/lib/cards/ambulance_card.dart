import 'package:care/models/models_export.dart';
import 'package:flutter/material.dart';

class AmbulanceCard extends StatelessWidget {
  AmbulanceModel aM;
  AmbulanceCard(this.aM, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Text(aM.username, style: const TextStyle(fontSize: 20)),
          subtitle: Text(aM.userphonenumber, style: const TextStyle(fontSize: 20)),
          trailing: InkWell(
            onTap: (){
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.edit_attributes_outlined,
                    size: 30.0,
                    color: Colors.brown[900],
                  ),
                  onPressed: () {
                    AmbulanceModel.endAmbulanceOrder(context: context, aM: aM);
                    // Write your code here
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete_forever_outlined,
                    size: 30.0,
                    color: Colors.brown[900],
                  ),
                  onPressed: () {

                    // Write your code here
                  },
                ),
              ],
            ),
          ),
        ),
        /*ListTile(
        leading: Text("dA.patientid", style: TextStyle(fontSize: 20)),
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
                // Write your code here
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete_forever_outlined,
                size: 30.0,
                color: Colors.brown[900],
              ),
              onPressed: () {
                // Write your code here
              },
            ),
          ],
        ),
      ),*/
      ],
    );
  }
}
