import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class modificarvehiculo extends StatefulWidget {
  const modificarvehiculo({super.key});

  @override
  State<modificarvehiculo> createState() => _modificarvehiculoState();
}

class _modificarvehiculoState extends State<modificarvehiculo> {
  final controller1=TextEditingController();
  final controller2=TextEditingController();
  @override
  Widget build(BuildContext context) {
    dynamic parametros=ModalRoute.of(context)?.settings.arguments;

    controller1.text=parametros['vehiculo'].sMarca;
    controller2.text=parametros['vehiculo'].sModelo;
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar / Eliminar"),
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
          ElevatedButton(
            onPressed: (){
              String idu=parametros['vehiculo'].ID_Vehiculo;
              final docUser=FirebaseFirestore.instance.collection('md_vehiculos').doc(idu);

              docUser.update({
                'sMarca':controller1.text,
                'sModelo':controller2.text,
              });
              Navigator.pop(context);
            }, 
            child: Text("Actualizar")
          ),          
          ElevatedButton(
            onPressed: (){
              String idu=parametros['vehiculo'].ID_Vehiculo;
              final docUser=FirebaseFirestore.instance.collection('md_vehiculos').doc(idu);

              docUser.delete();
              Navigator.pop(context);
            }, 
            child: Text("Eliminar")
          )
        ],
      ),
    );
  }
}