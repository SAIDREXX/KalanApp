import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class Member5 extends StatefulWidget {
  const Member5({super.key});

  @override
  State<Member5> createState() => _Member5State();
}

class _Member5State extends State<Member5> {
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
