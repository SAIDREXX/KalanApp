import 'package:flutter/material.dart';

class PriceOption extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final VoidCallback onSelect;

  const PriceOption(
      {required this.isSelected,
      required this.icon,
      required this.onSelect,
      super.key});

  @override
  Widget build(BuildContext context) {
    const selectedColor = Color.fromARGB(255, 29, 89, 139);

    return GestureDetector(
      onTap: onSelect,
      child: Container(
        width: 93,
        height: 45,
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : Colors.transparent,
          borderRadius: isSelected
              ? const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  bottomLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                )
              : const BorderRadius.all(Radius.zero),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : Colors.black,
                size: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
