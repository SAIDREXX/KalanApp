import 'package:flutter/material.dart';
import 'package:kalanapp/constants/colors.dart';

class ContactsNavBar extends StatefulWidget {
  final Function(int) onItemTapped;
  final Function(int) onLongPress;
  final Function(int) onItemSelected;

  const ContactsNavBar(
      {required this.onItemTapped,
      required this.onLongPress,
      required this.onItemSelected,
      super.key});

  @override
  State<ContactsNavBar> createState() => _ContactsNavBarState();
}

class _ContactsNavBarState extends State<ContactsNavBar> {
  int selectedIndex = 0;
  //Reemplazar con FamilyItem.itemCount cuando se logre generar los miembros con su cuenta de google
  int membersCount = 6;

  //Cambiar esto con un una variable que contenga el url a la imagen del perfil de cada cuenta
  List<String> profileImage = [
    'assets/family/Ester.png',
    'assets/family/Bad.png',
    'assets/family/Biyin.png',
    'assets/family/Nata.png',
    'assets/family/Dua.png',
    'assets/family/Dua.png'
  ];

  void onItemTapped(int index) {
    setState(() {});
  }

  void onLongPress(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(32),
      color: ColorConstants.jazPalette4,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/MayanBackground5.png'),
              fit: BoxFit.cover),
        ),
        height: 60,
        width: width / 1.15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Contactos',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ...List.generate(membersCount, (index) {
              return GestureDetector(
                onTap: () {
                  widget.onItemSelected(index);
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
                      width: 30,
                      decoration: BoxDecoration(
                          border: index == selectedIndex
                              ? Border(
                                  bottom: BorderSide(
                                    width: 3,
                                    color: ColorConstants.jazPalette3,
                                  ),
                                )
                              : null),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: ClipOval(
                              child: Image.asset(
                                profileImage[index],
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(
              width: 12,
            ),
          ],
        ),
      ),
    );
  }
}
