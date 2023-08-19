import 'package:flutter/material.dart';
import 'package:kalanapp/utils/set_status_button.dart';
import '../../utils/following_to_button.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 40,
        ),
        FollowingButton(
          index: 0,
        ),
        SizedBox(
          height: 450,
        ),
        StatusButton(
          userIndex: 0,
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
