import 'package:flutter/material.dart';

class FamilyItem extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback? onPressed;

  FamilyItem(
      {required this.imagePath,
      required this.text,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 100,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 14.49, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
