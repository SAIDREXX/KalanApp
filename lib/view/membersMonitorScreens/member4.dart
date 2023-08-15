import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class Member4 extends StatefulWidget {
  const Member4({super.key});

  @override
  State<Member4> createState() => _Member4State();
}

class _Member4State extends State<Member4> {
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
