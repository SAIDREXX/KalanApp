import 'package:flutter/material.dart';
import 'package:kalanapp/constants/colors.dart';

class NavBarKalan extends StatefulWidget {
  final Function(int) onItemTapped;
  final Function(int) onLongPress;
  final int indexPushed;

  const NavBarKalan(
      {required this.onItemTapped,
      required this.onLongPress,
      required this.indexPushed,
      super.key});

  @override
  State<NavBarKalan> createState() => _NavBarKalanState();
}

class _NavBarKalanState extends State<NavBarKalan> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.indexPushed;
  }

  List<IconData> iconData = [
    Icons.location_on_outlined,
    Icons.contacts_outlined,
    Icons.stars_rounded,
    Icons.folder_open_outlined,
    Icons.emergency_outlined,
  ];

  List<String> iconLabels = [
    'Ubicación',
    'Contactos',
    'Membresía',
    'Documentos',
    'Auxilio',
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void onLongPress(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
      color: ColorConstants.jazPalette4,
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/MayanBackground5.png'),
                fit: BoxFit.cover)),
        height: 80,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(iconData.length, (index) {
            return GestureDetector(
              onTap: () {
                widget.onItemTapped(index);
                setState(() {
                  selectedIndex = index;
                });
              },
              onLongPress: () {
                widget.onLongPress(index);
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    height: 60,
                    width: 35,
                    decoration: BoxDecoration(
                      border: index == selectedIndex
                          ? Border(
                              top: BorderSide(
                                width: 3,
                                color: ColorConstants.jazPalette3,
                              ),
                            )
                          : null,
                    ),
                    child: Icon(
                      iconData[index],
                      size: 35,
                      color: index == selectedIndex
                          ? ColorConstants.jazPalette3
                          : Colors.grey.shade800,
                    ),
                  ),
                  Text(
                    iconLabels[index],
                    style: TextStyle(
                      color: index == selectedIndex
                          ? ColorConstants.jazPalette3
                          : Colors.grey.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
