import 'package:flutter/material.dart';
import 'package:parcial4/paginas/usuarios/mostarusuarios.dart';
import 'package:parcial4/paginas/usuvehi/mostrarusuvehi.dart';
import 'package:parcial4/paginas/vehiculos/mostrarvehiculos.dart';

class principal extends StatefulWidget {
  const principal({super.key});

  @override
  State<principal> createState() => _principalState();
}

class _principalState extends State<principal> {
  int paginaIndex=0;
  @override
  Widget build(BuildContext context) {
      return Scaffold(
   
        body: getBody(),
        bottomNavigationBar:getFooter(),
      );
  }

    Widget getBody(){
    return IndexedStack(
      index: paginaIndex,
      children: [
        mostarusuarios(),
        mostrarvehiculos(),
        mostrarusuvehi()
      ],
    );
  }
  Widget getFooter(){
    List inconosItems=[
      Icons.person_outline,
      Icons.drive_eta,
      Icons.car_rental   
    ];
    List textoItems=[
      "Clientes",
      "Vehiculos",
      "clie/vehi"
    ];
    return Container(
      height:90 ,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left:20 ,right:20,top: 20 ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:List.generate(textoItems.length, (index){
            return GestureDetector(
              onTap: (){
                setState(() {
                  paginaIndex=index;
                });
              },
              child: Column(
                children: [
                  Icon(
                    inconosItems[index],
                    color: paginaIndex==index ? Colors.blue:Colors.grey
                  ),
                  Text(
                    textoItems[index],
                    style:TextStyle(color:paginaIndex==index ? Colors.blue:Colors.grey)
                  )
                ]
              ),
            );       
          })      
        ),
      ),
    );
  }
}