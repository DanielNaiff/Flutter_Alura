import 'package:flutter/material.dart';
import 'package:to_do_list/Initial_Screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  //classe myApp extende do stateless
  @override
  Widget build(BuildContext context) {
    //fucncao que retorna um widget
    return const MaterialApp(
      //parâmetros nomeados
      home: InitialScreen(),
    );
  }
}
