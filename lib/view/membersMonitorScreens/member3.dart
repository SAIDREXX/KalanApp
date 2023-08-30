import 'package:flutter/material.dart';
import 'package:kalanapp/map/google_map.dart';
import 'package:kalanapp/utils/following_to_button.dart';
import 'package:kalanapp/utils/set_status_button.dart';

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
        child: const SizedBox(
          width: 500,
          height: 500,
          child: Stack(
            alignment: Alignment.center,
            children: [
              GoogleMapsMaps(userIndex: 2),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  FollowingButton(
                    index: 2,
                  ),
                  Spacer(),
                  StatusButton(userIndex: 2),
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
