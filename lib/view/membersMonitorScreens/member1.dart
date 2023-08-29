import 'package:flutter/material.dart';
import 'package:kalanapp/map/google_map.dart';
import 'package:kalanapp/map/google_map_kalan.dart';
import 'package:kalanapp/utils/following_to_button.dart';
import 'package:kalanapp/utils/set_status_button.dart';

class Member1 extends StatefulWidget {
  const Member1({super.key});

  @override
  State<Member1> createState() => _Member1State();
}

class _Member1State extends State<Member1> {
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
              GoogleMapKalan(userIndex: 0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  FollowingButton(
                    index: 0,
                  ),
                  Spacer(),
                  StatusButton(userIndex: 0),
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
