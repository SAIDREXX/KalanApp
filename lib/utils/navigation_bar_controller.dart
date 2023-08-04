import 'package:flutter/material.dart';
import 'package:kalanapp/constants/colors.dart';
import 'package:kalanapp/utils/kalan_navigaton_bar.dart';
import 'package:kalanapp/utils/sos_modal.dart';
import 'package:kalanapp/view/gridTabs/contacts.dart';
import 'package:kalanapp/view/gridTabs/monitor.dart';
import 'package:kalanapp/view/pricing.dart';
import 'package:kalanapp/view/secure_folder.dart';

class PageControllerKalan extends StatefulWidget {
  final int indexRequired;
  const PageControllerKalan({required this.indexRequired, super.key});

  @override
  State<PageControllerKalan> createState() => _PageControllerKalanState();
}

class _PageControllerKalanState extends State<PageControllerKalan> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.indexRequired;
  }

  List<Widget> pageList = [
    const MonitorPage(),
    const ContactsPage(),
    const PricingPage(),
    const SecureFolderPage(),
    const SOSPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pageList,
      ),
      bottomNavigationBar: Container(
        color: ColorConstants.jazPalette2,
        child: NavBarKalan(
          onItemTapped: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          indexPushed: widget.indexRequired,
        ),
      ),
    );
  }
}
//Routes(index: index),
