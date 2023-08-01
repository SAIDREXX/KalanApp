import 'package:flutter/material.dart';
import 'package:kalanapp/constants/colors.dart';
import 'package:kalanapp/home_screen.dart';
import 'package:kalanapp/utils/grid_image_widget.dart';
import 'package:kalanapp/view/gridTabs/contacts.dart';
import 'package:kalanapp/view/gridTabs/family_members.dart';
import 'package:kalanapp/view/gridTabs/help_numbers.dart';
import 'package:kalanapp/view/gridTabs/monitor.dart';
import 'package:kalanapp/view/pricing.dart';
import 'package:kalanapp/view/settings/settings_main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final user = FirebaseAuth.instance.currentUser;

    Widget _getUserProfileImage() {
      if (user?.photoURL != null) {
        return ClipOval(
          child: Image.network(
            user!.photoURL!,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        );
      } else {
        return ClipOval(
          child: Image.asset(
            'assets/default_profile.png',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: ColorConstants.jazPalette2,
      body: SizedBox(
        height: height,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: height / 2.5,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorConstants.jazPalette3,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
                image: const DecorationImage(
                  image: AssetImage('assets/MayanBackground5.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70,
                    child: Image.asset('assets/kalan_logo_full.png'),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: SizedBox(
                        child: Icon(
                          Icons.notifications_none_outlined,
                          size: 50,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 42,
                        child: MaterialButton(
                          onPressed: () {},
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                            side:
                                const BorderSide(color: Colors.white, width: 1),
                          ),
                          child: const Text(
                            'S.O.S',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Expanded(
                      flex: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: _getUserProfileImage(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: height / 1.4,
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 35,
                          padding: const EdgeInsets.all(10),
                          children: [
                            ImageItem(
                              imagePath: 'assets/gridview/map2.png',
                              text: 'Monitoreo',
                              onPressed: () =>
                                  Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              ),
                            ),
                            ImageItem(
                              imagePath: 'assets/gridview/family.png',
                              text: 'Familia',
                              onPressed: () =>
                                  Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const FamilyPage(),
                                ),
                              ),
                            ),
                            ImageItem(
                              imagePath: 'assets/gridview/contact.png',
                              text: 'Contactos',
                              onPressed: () =>
                                  Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const ContactsPage(),
                                ),
                              ),
                            ),
                            ImageItem(
                              imagePath: 'assets/gridview/emergency.png',
                              text: 'Num. De Ayuda',
                              onPressed: () =>
                                  Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const HelpNumbersPage(),
                                ),
                              ),
                            ),
                            ImageItem(
                              imagePath: 'assets/gridview/membership.png',
                              text: 'Membresía',
                              onPressed: () =>
                                  Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const PricingPage(),
                                ),
                              ),
                            ),
                            ImageItem(
                              imagePath: 'assets/gridview/settings.png',
                              text: 'Ajustes',
                              onPressed: () =>
                                  Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const SettingsPage(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
