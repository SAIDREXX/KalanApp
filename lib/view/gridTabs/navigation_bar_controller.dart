import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kalanapp/constants/colors.dart';
import 'package:kalanapp/main_menu.dart';
import 'package:kalanapp/utils/kalan_navigaton_bar.dart';
import 'package:kalanapp/utils/monitor_controller.dart';
import 'package:kalanapp/utils/sos_screen.dart';
import 'package:kalanapp/view/gridTabs/contacts.dart';
import 'package:kalanapp/view/pricing.dart';
import 'package:kalanapp/view/secure_folder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageControllerKalan extends StatefulWidget {
  final int indexRequired;
  const PageControllerKalan({required this.indexRequired, super.key});

  @override
  State<PageControllerKalan> createState() => _PageControllerKalanState();
}

class _PageControllerKalanState extends State<PageControllerKalan> {
  late String groupName;
  late User? user;
  int currentIndex = 0;
  int previousIndex = 0;
  //ToDo: Modificar el  valor de accountIndex aplicando un orderBy de TimeStamp a los datos y actualizar el valor con el index correspondiente al dueño de la cuenta
  late int accountIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.indexRequired;
    previousIndex = currentIndex;
    user = FirebaseAuth.instance.currentUser;
    loadGroupName();
  }

  void loadGroupName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      groupName = prefs.getString('groupName') ?? user!.uid.substring(0, 6);
      accountIndex = prefs.getInt('groupPosition') ?? 0;
      print('La posición en NavBar es: $accountIndex');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          MonitorController(
            index: accountIndex,
          ),
          const ContactsPage(),
          const PricingPage(),
          const SecureFolderPage(),
          const KalanSOSPage(),
        ],
      ),
      bottomNavigationBar: Container(
        color: currentIndex == 0
            ? ColorConstants.jazPalette3
            : ColorConstants.jazPalette2,
        child: NavBarKalan(
          onItemTapped: (index) {
            if (index == 4) {
              showDialog(
                context: context,
                builder: (context) {
                  return const Center(
                    child: KalanSOSPage(),
                  );
                },
              );
            }
            setState(() {
              previousIndex = currentIndex;
              currentIndex = index;
            });
          },
          onLongPress: (index) {
            if (index == 0) {
              setState(() {
                previousIndex = currentIndex;
                currentIndex = index;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainMenu(),
                  ),
                );
              });
            }
          },
          indexPushed: widget.indexRequired,
        ),
      ),
    );
  }
}
