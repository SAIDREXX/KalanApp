import 'package:flutter/material.dart';

class PriceOptionText extends StatelessWidget {
  final bool isSelected;
  final String price;
  final VoidCallback onSelect;

  const PriceOptionText(
      {required this.isSelected,
      required this.price,
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
              Text(
                price,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
