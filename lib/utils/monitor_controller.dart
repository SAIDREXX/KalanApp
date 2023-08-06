import 'package:flutter/material.dart';
import 'package:kalanapp/utils/contacts_nav_bar.dart';
import 'package:kalanapp/view/membersMonitorScreens/member1.dart';
import 'package:kalanapp/view/membersMonitorScreens/member5.dart';
import 'package:kalanapp/view/membersMonitorScreens/member6.dart';
import '../constants/colors.dart';
import '../view/membersMonitorScreens/member2.dart';
import '../view/membersMonitorScreens/member3.dart';
import '../view/membersMonitorScreens/member4.dart';

class MonitorController extends StatefulWidget {
  const MonitorController({super.key});

  @override
  State<MonitorController> createState() => _MonitorControllerState();
}

class _MonitorControllerState extends State<MonitorController> {
  int currentIndex = 0;

  void onItemSelected(int index) {
    currentIndex = index;
  }

  List<Widget> internalMonitorPages = [
    const Member1(),
    const Member2(),
    const Member3(),
    const Member4(),
    const Member5(),
    const Member6(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.jazPalette3,
      extendBody: true,
      body: IndexedStack(
        index: currentIndex,
        children: internalMonitorPages,
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 50),
        child: ContactsNavBar(
          onItemTapped: (index) {
            setState(() {});
          },
          onLongPress: (index) {
            setState(() {});
          },
          onItemSelected: onItemSelected,
        ),
      ),
    );
  }
}
