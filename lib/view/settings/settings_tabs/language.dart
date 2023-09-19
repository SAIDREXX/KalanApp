import 'package:flutter/material.dart';

class LeguagePage extends StatefulWidget {
  const LeguagePage({Key? key}) : super(key: key);

  @override
  State<LeguagePage> createState() => LeguagePageState();
}

class LeguagePageState extends State<LeguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lenguajes'),
      ),
      body: const Center(
        child: Text('Apartado de Lenguaje'),
      ),
    );
  }
}
