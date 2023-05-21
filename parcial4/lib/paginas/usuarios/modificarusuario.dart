import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class modificarusuario extends StatefulWidget {
  const modificarusuario({super.key});

  @override
  State<modificarusuario> createState() => _modificarusuarioState();
}

class _modificarusuarioState extends State<modificarusuario> {
  
  final controller1=TextEditingController();
  final controller2=TextEditingController();
  final controller3=TextEditingController();
  final controller4=TextEditingController();
  @override
  Widget build(BuildContext context) {
    dynamic parametros=ModalRoute.of(context)?.settings.arguments;

    controller1.text=parametros['usuario'].sNombreCliente;
    controller2.text=parametros['usuario'].sApellidosCliente;
    controller3.text=parametros['usuario'].sDireccionCliente;
    controller4.text=parametros['usuario'].sCiudadCliente;

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
              String idu=parametros['usuario'].ID_Cliente;
              final docUser=FirebaseFirestore.instance.collection('md_clientes').doc(idu);

              docUser.update({
                'sNombreCliente':controller1.text,
                'sApellidosCliente':controller2.text,
                'sDireccionCliente':controller3.text,
                'sCiudadCliente':controller4.text
              });
              Navigator.pop(context);
            }, 
            child: Text("Actualizar")
          ),          
          ElevatedButton(
            onPressed: (){
              String idu=parametros['usuario'].ID_Cliente;
              final docUser=FirebaseFirestore.instance.collection('md_clientes').doc(idu);

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