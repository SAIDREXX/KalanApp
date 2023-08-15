import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class Member6 extends StatefulWidget {
  const Member6({super.key});

  @override
  State<Member6> createState() => _Member6State();
}

class _Member6State extends State<Member6> {
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
