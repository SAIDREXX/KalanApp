import 'package:flutter/material.dart';
import 'package:kalanapp/map/google_map.dart';
import 'package:kalanapp/utils/following_to_button.dart';
import 'package:kalanapp/utils/set_status_button.dart';

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
        child: const SizedBox(
          width: 500,
          height: 500,
          child: Stack(
            alignment: Alignment.center,
            children: [
              GoogleMapsMaps(userIndex: 3),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  FollowingButton(
                    index: 3,
                  ),
                  Spacer(),
                  StatusButton(userIndex: 3),
                  SizedBox(
                    height: 150,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
