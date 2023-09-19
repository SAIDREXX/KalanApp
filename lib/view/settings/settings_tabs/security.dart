import 'package:flutter/material.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({Key? key}) : super(key: key);

  @override
  State<SecurityPage> createState() => SecuritypageState();
}

class SecuritypageState extends State<SecurityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seguridad "),
      ),
      body: const Center(
        child: Text('esto es el apartado de seguridad'),
      ),
    );
  }
}
