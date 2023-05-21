import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parcial4/modelos/Vehiculos.dart';

class agregarvehiculo extends StatefulWidget {
  const agregarvehiculo({super.key});

  @override
  State<agregarvehiculo> createState() => _agregarvehiculoState();
}

class _agregarvehiculoState extends State<agregarvehiculo> {
  final controller1=TextEditingController();
  final controller2=TextEditingController();
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
              decoration: InputDecoration(hintText: "Marca"),
              controller: controller1,
            ),
            
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              decoration: InputDecoration(hintText: "Modelo"),
              controller: controller2,
            ),
            
          ),
          ElevatedButton(
            onPressed: (){
              final vehi=Vehiculos(
                sMarca: controller1.text,
                sModelo: controller2.text
              );
              createUser(vehi);
              
              Navigator.pop(context);
            }, 
            child: Text("Agregar"))
        ],
      ),
    );
  }

  Future createUser(Vehiculos vehi) async{
    final docUser=FirebaseFirestore.instance.collection('md_vehiculos').doc();
    vehi.ID_Vehiculo=docUser.id;

    final json=vehi.toJson();

    await docUser.set(json);
  }
}