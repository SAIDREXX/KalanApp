import 'package:flutter/material.dart';

class ProfilePicturesList extends StatelessWidget {
  final String imagePath;

  const ProfilePicturesList({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 35,
            height: 35,
            child: ClipOval(
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
