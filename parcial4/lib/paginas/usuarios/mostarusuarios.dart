import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parcial4/modelos/usuarios.dart';


class mostarusuarios extends StatefulWidget {
  const mostarusuarios({super.key});

  @override
  State<mostarusuarios> createState() => _mostarusuariosState();
}

class _mostarusuariosState extends State<mostarusuarios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Clientes"),
          actions: [
            IconButton( 
              icon: Icon(Icons.add),
              onPressed: () async {
                await Navigator.pushNamed(context, '/addU');
                setState(() {});    
              }
            )
          ],
      ),
      body: StreamBuilder<List<Usuarios>>(
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

  Widget buildUser(Usuarios user)=>ListTile(
    leading: CircleAvatar(child: Text("U")),
    title: Text(user.sNombreCliente+" "+user.sApellidosCliente),
    subtitle: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: 'Dirección: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text:user.sDireccionCliente)
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: 'Ciudad: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text:user.sCiudadCliente)
            ],
          ),
        ),
      ]
    ),
    isThreeLine: true,
    onTap: () async{
      await Navigator.pushNamed(context, '/editU',
      arguments: {'usuario':user});
    },  
  );

  Stream<List<Usuarios>> readUsers()=>FirebaseFirestore.instance
  .collection('md_clientes')
  .snapshots()
  .map((snap) => 
    snap.docs.map((doc) => Usuarios.fromJson(doc.data())).toList());
}