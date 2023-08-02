import 'package:flutter/material.dart';
import 'package:kalanapp/constants/colors.dart';

class NavigationBarKalan extends StatelessWidget {
  final int currentIndex;
  final List<IconData> icons;
  final List<String> labels;
  final void Function(int index) onTap;

  const NavigationBarKalan(
      {required this.currentIndex,
      required this.onTap,
      required this.icons,
      required this.labels,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: Colors.white,
          selectedItemColor: ColorConstants.jazPalette3,
          unselectedItemColor: ColorConstants.greyScale2,
          items: List.generate(
            icons.length,
            (index) => BottomNavigationBarItem(
              icon: Icon(
                icons[index],
                size: 35,
              ),
              label: labels[index],
            ),
          ),
        ),
      ),
    );
  }
}
