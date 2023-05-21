import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:parcial4/paginas/principal.dart';
import 'package:parcial4/paginas/usuarios/agregarusuario.dart';
import 'package:parcial4/paginas/usuarios/modificarusuario.dart';
import 'package:parcial4/paginas/usuvehi/agregarusuvehi.dart';
import 'package:parcial4/paginas/vehiculos/agregarvehiculo.dart';
import 'package:parcial4/paginas/vehiculos/modificarvehiculo.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FirebaseCRUD',
      initialRoute: '/',
      routes: {
        '/': (context) => const principal(),
        '/addU': (context) => const agregarusuario(),
        '/editU': (context)=> const modificarusuario(),
        '/addV': (context) => const agregarvehiculo(),
        '/editV': (context)=> const modificarvehiculo(),
        '/addCV': (context) => const agregarusuvehi(),
      },
    );
 }
}