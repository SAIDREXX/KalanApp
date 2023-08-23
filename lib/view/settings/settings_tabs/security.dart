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
        title: Text("Seguridad "),
      ),
      body: Center(
        child: Text('esto es el apartado de seguridad'),
      ),
    );
  }
}
