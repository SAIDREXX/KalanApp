import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class Member3 extends StatefulWidget {
  const Member3({super.key});

  @override
  State<Member3> createState() => _Member3State();
}

class _Member3State extends State<Member3> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: height,
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            color: ColorConstants.jazPalette3,
            image: const DecorationImage(
              image: AssetImage('assets/MayanBackground5.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
