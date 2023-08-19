import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../utils/following_to_button.dart';
import '../../utils/set_status_button.dart';

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
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              FollowingButton(
                index: 5,
              ),
              Spacer(),
              StatusButton(userIndex: 5),
              SizedBox(
                height: 150,
              )
            ],
          ),
        ),
      ),
    );
  }
}
