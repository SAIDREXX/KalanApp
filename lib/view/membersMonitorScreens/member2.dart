import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class Member2 extends StatefulWidget {
  const Member2({super.key});

  @override
  State<Member2> createState() => _Member2State();
}

class _Member2State extends State<Member2> {
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
