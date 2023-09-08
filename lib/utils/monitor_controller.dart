//Librerias
import 'package:flutter/material.dart';
import 'package:kalanapp/utils/contacts_nav_bar_kalan.dart';
import 'package:kalanapp/view/membersMonitorScreens/member1.dart';
import 'package:kalanapp/view/membersMonitorScreens/member2.dart';
import '../view/membersMonitorScreens/member3.dart';
import '../view/membersMonitorScreens/member4.dart';
import 'package:kalanapp/view/membersMonitorScreens/member5.dart';
import 'package:kalanapp/view/membersMonitorScreens/member6.dart';

import '../constants/colors.dart';

class MonitorController extends StatefulWidget {
  final int index;
  const MonitorController({required this.index, super.key});

  @override
  State<MonitorController> createState() => _MonitorControllerState();
}

class _MonitorControllerState extends State<MonitorController> {
  int currentIndex = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    updateState();

    print('El valor en Monitor Es: $currentIndex');
  }

  void updateState() async {
    setState(() {});
    currentIndex = widget.index;
    isLoading = false;
  }

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

  Widget loadingWidget() {
    return Center(
      child: CircularProgressIndicator(
        color: ColorConstants.jazPalette3,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: isLoading
          ? loadingWidget()
          : IndexedStack(
              index: currentIndex,
              children: internalMonitorPages,
            ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 50),
        child: ContactsNavBarKalan(
          onItemTapped: (index) {
            setState(() {});
          },
          onLongPress: (index) {
            setState(() {});
          },
          onItemSelected: onItemSelected,
          index: currentIndex,
        ),
      ),
    );
  }
}
