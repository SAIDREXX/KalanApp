import 'package:flutter/material.dart';

class AccesibilityPage extends StatefulWidget {
  const AccesibilityPage({Key? key}) : super(key: key);

  @override
  State<AccesibilityPage> createState() => AccesibilityPageState();
}

class AccesibilityPageState extends State<AccesibilityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accesibilidad"),
      ),
      body: Center(
        child: Text('Esto es el apartado de Accesibilidad'),
      ),
    );
  }
}
