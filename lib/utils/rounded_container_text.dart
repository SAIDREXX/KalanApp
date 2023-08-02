import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final Color backgroundColor;
  final EdgeInsets padding;
  final int selected;

  const RoundedContainer(
      {required this.child,
      this.borderRadius = 32,
      this.backgroundColor = Colors.white,
      this.padding = const EdgeInsets.all(16.0),
      this.selected = 0,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
