import 'package:flutter/material.dart';
import 'package:kalanapp/map/google_map.dart';
import 'package:kalanapp/utils/following_to_button.dart';
import 'package:kalanapp/utils/set_status_button.dart';

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
        child: const SizedBox(
          width: 500,
          height: 500,
          child: Stack(
            alignment: Alignment.center,
            children: [
              GoogleMapsMaps(userIndex: 5),
              Column(
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
