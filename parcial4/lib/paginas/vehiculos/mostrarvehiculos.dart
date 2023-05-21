import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parcial4/modelos/Vehiculos.dart';

class mostrarvehiculos extends StatefulWidget {
  const mostrarvehiculos({super.key});

  @override
  State<mostrarvehiculos> createState() => _mostrarvehiculosState();
}

class _mostrarvehiculosState extends State<mostrarvehiculos> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
          title: Text("Vehiculos"),
          actions: [
            IconButton( 
              icon: Icon(Icons.add),
              onPressed: () async {
                await Navigator.pushNamed(context, '/addV');
                setState(() {});    
              }
            )
          ],
      ),
      body: StreamBuilder<List<Vehiculos>>(
        stream: readVehiculos(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Center(child: Text('Error: ${snapshot.error}'));
          }else if(snapshot.hasData){
            final vehi=snapshot.data!;

            return ListView(
              children: vehi.map(buildUser).toList(),
            );
              
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

    Widget buildUser(Vehiculos vehi)=>ListTile(
    leading: CircleAvatar(child: Text("V")),
    title: Text(vehi.sMarca),
    subtitle: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: 'Modelo: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text:vehi.sModelo)
            ],
          ),
        ),
        
      ]
    ),
    isThreeLine: true,
    onTap: () async{
      await Navigator.pushNamed(context, '/editV',
      arguments: {'vehiculo':vehi});
    },  
  );

  Stream<List<Vehiculos>> readVehiculos()=>FirebaseFirestore.instance
  .collection('md_vehiculos')
  .snapshots()
  .map((snap) => 
    snap.docs.map((doc) => Vehiculos.fromJson(doc.data())).toList());
}