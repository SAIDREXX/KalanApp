import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kalanapp/constants/colors.dart';
import 'package:kalanapp/utils/grid_image_widget.dart';
import 'package:kalanapp/utils/sos_screen.dart';
import 'package:kalanapp/view/gridTabs/navigation_bar_controller.dart';
import 'package:kalanapp/view/gridTabs/family_members.dart';
import 'package:kalanapp/view/gridTabs/help_numbers.dart';
import 'package:kalanapp/view/settings/settings_main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  late SharedPreferences prefs;
  late String groupName;
  late User? user;
  @override
  void initState() {
    super.initState();
    checkPermissions();
  }

  Future<void> checkPermissions() async {
    List<Permission> permissions = [
      Permission.location,
      Permission.notification,
      Permission.phone,
    ];
    for (var permission in permissions) {
      var status = await permission.status;
      if (!status.isGranted) {
        var result = await permission.request();
        if (result.isPermanentlyDenied) {}
      }
    }

    prefs = await SharedPreferences.getInstance();
    setState(() {
      user = FirebaseAuth.instance.currentUser;
      groupName = prefs.getString('groupName') ?? user!.uid.substring(0, 6);
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final user = FirebaseAuth.instance.currentUser;
    final userId = user!.uid;

    Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.best,
      distanceFilter:
          10, //Distancia que tiene que recorrer el usuario para actualizar (Metros)
    )).listen((Position position) async {
      groupName = prefs.getString('groupName') ?? user.uid.substring(0, 6);
      DocumentSnapshot groupDoc = await FirebaseFirestore.instance
          .collection('groups')
          .doc(groupName)
          .get();

      if (groupDoc.exists) {
        Map<String, dynamic> membersInfo = groupDoc['membersInfo'];
        membersInfo[userId] = {
          ...membersInfo[userId],
          'latitude': position.latitude,
          'longitude': position.longitude,
          'lastLocationTime': FieldValue.serverTimestamp(),
        };
        await groupDoc.reference.update({
          'membersInfo': membersInfo,
        });
      }
    });

    Widget getUserProfileImage() {
      if (user.photoURL != null) {
        return ClipOval(
          child: Image.network(
            user.photoURL!,
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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.notifications_none_outlined,
                    size: 50,
                    color: ColorConstants.jazPalette4,
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    child: SizedBox(
                      height: 42, // Ajusta el alto del botón aquí
                      child: MaterialButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const Center(
                                  child: KalanSOSPage(),
                                );
                              });
                        },
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                          side:
                              const BorderSide(color: Colors.white, width: 1.5),
                        ),
                        child: const Text(
                          'S.O.S',
                          style: TextStyle(
                            fontSize: 18, // Ajusta el tamaño de fuente aquí
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                  Container(
                    child: getUserProfileImage(),
                  ),
                ],
              ),
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
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const PageControllerKalan(
                                    indexRequired: 0,
                                  ),
                                ),
                              ),
                            ),
                            ImageItem(
                              imagePath: 'assets/gridview/family.png',
                              text: 'Familia',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const FamilyPage(),
                                  ),
                                );
                              },
                            ),
                            ImageItem(
                              imagePath: 'assets/gridview/contact.png',
                              text: 'Contactos',
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const PageControllerKalan(
                                    indexRequired: 1,
                                  ),
                                ),
                              ),
                            ),
                            ImageItem(
                              imagePath: 'assets/gridview/emergency.png',
                              text: 'Num. De Ayuda',
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HelpNumbersPage(),
                                ),
                              ),
                            ),
                            ImageItem(
                              imagePath: 'assets/gridview/membership.png',
                              text: 'Membresía',
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const PageControllerKalan(
                                    indexRequired: 2,
                                  ),
                                ),
                              ),
                            ),
                            ImageItem(
                              imagePath: 'assets/gridview/settings.png',
                              text: 'Ajustes',
                              onPressed: () => Navigator.push(
                                context,
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
