import 'package:care/cards/ambulance_card.dart';
import 'package:care/models/models_export.dart';
import 'package:flutter/material.dart';

class AmbulanceOrder extends StatefulWidget {
  const AmbulanceOrder({Key? key}) : super(key: key);

  @override
  State<AmbulanceOrder> createState() => _AmbulanceOrderState();
}

class _AmbulanceOrderState extends State<AmbulanceOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Column(
        children: [
          const Text('Orders',
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 10),
          ambulanceOrder(),
        ],
      ),
    );
  }
  Widget ambulanceOrder(){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height *0.6,
      child: FutureBuilder<List<AmbulanceModel>>(
        future: AmbulanceModel.getAmbulance(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<AmbulanceModel> ambulanceModelList =
              snapshot.data as List<AmbulanceModel>;
              List<AmbulanceCard> ambulanceCard = [];
              for (var i in ambulanceModelList) {
                ambulanceCard.add(AmbulanceCard(i));
              }
              return ListView(
                children: ambulanceCard,
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
