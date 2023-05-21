import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parcial4/modelos/Usuarios.dart';

class agregarusuario extends StatefulWidget {
  const agregarusuario({super.key});

  @override
  State<agregarusuario> createState() => _agregarusuarioState();
}

class _agregarusuarioState extends State<agregarusuario> {

  final controller1=TextEditingController();
  final controller2=TextEditingController();
  final controller3=TextEditingController();
  final controller4=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              decoration: InputDecoration(hintText: "Nombre"),
              controller: controller1,
            ),
            
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              decoration: InputDecoration(hintText: "Apellido"),
              controller: controller2,
            ),
            
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              decoration: InputDecoration(hintText: "Direccion"),
              controller: controller3,
            ),
            
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              decoration: InputDecoration(hintText: "Ciudad"),
              controller: controller4,
            ),
            
          ),
          ElevatedButton(
            onPressed: (){
              final user=Usuarios(
                sNombreCliente: controller1.text,
                sApellidosCliente: controller2.text,
                sDireccionCliente: controller3.text,
                sCiudadCliente: controller4.text
              );
              createUser(user);
              
              Navigator.pop(context);
            }, 
            child: Text("Agregar"))
        ],
      ),
    );
  }

  Future createUser(Usuarios user) async{
    final docUser=FirebaseFirestore.instance.collection('md_clientes').doc();
    user.ID_Cliente=docUser.id;

    final json=user.toJson();

    await docUser.set(json);
  }
}