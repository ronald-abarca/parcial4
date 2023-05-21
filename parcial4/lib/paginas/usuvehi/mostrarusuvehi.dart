import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../modelos/UsuVehi.dart';

class mostrarusuvehi extends StatefulWidget {
  const mostrarusuvehi({super.key});

  @override
  State<mostrarusuvehi> createState() => _mostrarusuvehiState();
}

class _mostrarusuvehiState extends State<mostrarusuvehi> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Clientes Vehiculos"),
          actions: [
            IconButton( 
              icon: Icon(Icons.add),
              onPressed: () async {
                await Navigator.pushNamed(context, '/addCV');
                setState(() {});    
              }
            )
          ],
      ),
      body: StreamBuilder<List<UsuVehi>>(
        stream: readUsers(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Center(child: Text('Error: ${snapshot.error}'));
          }else if(snapshot.hasData){
            final users=snapshot.data!;

            return ListView(
              children: users.map(buildUser).toList(),
            );
              
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildUser(UsuVehi usuvehi)=>ListTile(
    leading: CircleAvatar(child: Text("CV")),
    title: Text(usuvehi.ID_Cliente+" "+usuvehi.ID_Vehiculo),
    subtitle: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: 'Matricula: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text:usuvehi.sMatricula)
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: 'Kilometros: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text:usuvehi.Kilometros.toString())
            ],
          ),
        ),
      ]
    ),
    isThreeLine: true,
    onTap: () async{

    },  
  );

  Stream<List<UsuVehi>> readUsers()=>FirebaseFirestore.instance
  .collection('md_clientevehiculo')
  .snapshots()
  .map((snap) => 
    snap.docs.map((doc) => UsuVehi.fromJson(doc.data())).toList());

}

