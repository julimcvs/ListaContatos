import 'package:flutter/material.dart';
import 'package:lista_contatos/screens/home.dart';
import 'package:lista_contatos/screens/lista_contatos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/lista-contatos': (context) => ListaContatos(),
      },
    );
  }
}