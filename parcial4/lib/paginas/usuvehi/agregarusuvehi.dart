import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parcial4/modelos/UsuVehi.dart';
import 'package:parcial4/modelos/Vehiculos.dart';

import '../../modelos/Usuarios.dart';

class agregarusuvehi extends StatefulWidget {
  const agregarusuvehi({super.key});

  @override
  State<agregarusuvehi> createState() => _agregarusuvehiState();
}

class _agregarusuvehiState extends State<agregarusuvehi> {
  final controller1=TextEditingController();
  final controller2=TextEditingController();

  
  Usuarios? _selectedItem;
  List<Usuarios> _items = [];
  
  Vehiculos? _selectedItem2;
  List<Vehiculos> _items2 = [];

  Future<void> fetchData() async {
    final snapshot = await FirebaseFirestore.instance.collection('md_clientes').get();
    setState(() {
      _items = snapshot.docs.map((doc) => Usuarios(sNombreCliente: doc['sNombreCliente'],sApellidosCliente:doc['sApellidosCliente'],sCiudadCliente: doc['sCiudadCliente'],sDireccionCliente: doc['sCiudadCliente'],ID_Cliente: doc['ID_Cliente'] )).toList();

      if(_items.length!=0){

        _selectedItem=_items[0];
      }
    });
  }

  Future<void> fetchData2() async {
    final snapshot = await FirebaseFirestore.instance.collection('md_vehiculos').get();
    setState(() {
      _items2 = snapshot.docs.map((doc) => Vehiculos(sMarca: doc['sMarca'], sModelo: doc['sModelo'],ID_Vehiculo: doc['ID_Vehiculo'])).toList();
      if(_items2.length!=0){

        _selectedItem2=_items2[0];
      }
    });
  }

  void initState(){
    super.initState();
      Firebase.initializeApp().then((value) {
      fetchData();
      fetchData2();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<Usuarios>(
            value: _selectedItem,
            items: _items.map((Usuarios item) {
              return DropdownMenuItem<Usuarios>(
                value: item,
                child: Text('${item.sNombreCliente} - ${item.sApellidosCliente}'),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedItem = value;
              });
            },
            hint: Text('Selecciona un elemento'),
          ),
          DropdownButton<Vehiculos>(
            value: _selectedItem2,
            items: _items2.map((Vehiculos item) {
              return DropdownMenuItem<Vehiculos>(
                value: item,
                child: Text('${item.sMarca} - ${item.sModelo}'),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedItem2 = value;
              });
            },
            hint: Text('Selecciona un elemento'),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              decoration: InputDecoration(hintText: "matricula"),
              controller: controller1,
            ),
            
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              decoration: InputDecoration(hintText: "kilometros",),
              controller: controller2,
              keyboardType: TextInputType.number,
            ),
            
          ),
          ElevatedButton(
            onPressed: (){
              final uservehi=UsuVehi(
                ID_Cliente: _selectedItem!.ID_Cliente,
                ID_Vehiculo: _selectedItem2!.ID_Vehiculo,
                sMatricula: controller1.text,
                Kilometros: int.parse(controller2.text)
              );
              createUser(uservehi);
              
              Navigator.pop(context);
            }, 
            child: Text("Agregar"))
        ],
      ),
    );
  }

  Future createUser(UsuVehi usvehi) async{
    final docUser=FirebaseFirestore.instance.collection('md_clientevehiculo').doc();
      final json=usvehi.toJson();

    await docUser.set(json);
  }
}