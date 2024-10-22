import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kalanapp/auth/google_signin.dart';
import 'package:kalanapp/constants/colors.dart';
import 'package:kalanapp/view/login_page.dart';
import 'package:kalanapp/view/settings/settings_tabs/accesibility.dart';
import 'package:kalanapp/view/settings/settings_tabs/language.dart';
import 'package:kalanapp/view/settings/settings_tabs/location.dart';
import 'package:kalanapp/view/settings/settings_tabs/notifications.dart';
import 'package:kalanapp/view/settings/settings_tabs/security.dart';
import 'package:kalanapp/view/settings/settings_tabs/support.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/notification_services.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  late User? user;
  bool _isDarkMode = false;
  final userName = FirebaseAuth.instance.currentUser!.displayName;
  final userEmail = FirebaseAuth.instance.currentUser!.email;
  String userNameNotNull = '';
  String userEmailNotNull = '';

  @override
  void initState() {
    super.initState();
    if (userName != null) {
      userNameNotNull = userName ?? 'Usuario Sin Nombre';
    }

    if (userEmail != null) {
      userEmailNotNull = userEmail ?? 'noemail@defaultemail.com';
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    String userId = user!.uid;
    final height = MediaQuery.of(context).size.height;

    Widget getUserProfileImage() {
      if (user.photoURL != null) {
        return ClipOval(
          child: Image.network(
            user.photoURL!,
            width: 100,
            height: 100,
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
              height: height / 2,
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
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    getUserProfileImage(),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          userNameNotNull,
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter,',
                              color: ColorConstants.starterWhite),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          userEmailNotNull,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter',
                              color: ColorConstants.greyScale4,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: height / 1.45,
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.close,
                                size: 25,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Ajustes',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Inter',
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              width: 60,
                            ),
                            const Icon(
                              Icons.wb_sunny_outlined,
                              size: 25,
                            ),
                            Expanded(
                              child: SwitchListTile.adaptive(
                                value: _isDarkMode,
                                onChanged: (value) {
                                  setState(() {
                                    _isDarkMode = value;
                                  });
                                },
                                contentPadding: EdgeInsets.zero,
                                activeColor: ColorConstants.jazPalette3,
                                inactiveTrackColor: ColorConstants.jazPalette2,
                              ),
                            ),
                            const Icon(
                              Icons.nightlight_outlined,
                              size: 25,
                            ),
                          ],
                        ),
                        //Boton de Cuenta
                        OutlinedButton(
                          onPressed: () {
                            showNotificaction();
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: ColorConstants.greyScale1,
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          child: SizedBox(
                            height: 42,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  color: ColorConstants.jazPalette5,
                                  size: 30,
                                ),
                                Text(
                                  'Cuenta',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorConstants.greyScale2,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: ColorConstants.jazPalette5,
                                      size: 20,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        //Linea
                        Container(
                          color: ColorConstants.greyScale1,
                          height: 1,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        //Boton de Seguridad
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SecurityPage()),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: ColorConstants.greyScale1,
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          child: SizedBox(
                            height: 42,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.lock_outline,
                                    color: ColorConstants.jazPalette5,
                                    size: 30,
                                  ),
                                  //const SizedBox(width: 50),
                                  Text(
                                    'Seguridad',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorConstants.greyScale2,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: ColorConstants.jazPalette5,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        //Linea
                        Container(
                          color: ColorConstants.greyScale1,
                          height: 1,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        //Boton de Notificaciones
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NotificationPage(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: ColorConstants.greyScale1,
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          child: SizedBox(
                            height: 42,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.notifications_none_outlined,
                                    color: ColorConstants.jazPalette5,
                                    size: 30,
                                  ),
                                  //const SizedBox(width: 50),
                                  Text(
                                    'Notificaciones',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorConstants.greyScale2,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: ColorConstants.jazPalette5,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        //Linea
                        Container(
                          color: ColorConstants.greyScale1,
                          height: 1,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        //Boton de locacion
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LocationPage(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: ColorConstants.greyScale1,
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          child: SizedBox(
                            height: 42,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: ColorConstants.jazPalette5,
                                    size: 30,
                                  ),
                                  //const SizedBox(width: 50),
                                  Text(
                                    'Ubicación',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorConstants.greyScale2,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: ColorConstants.jazPalette5,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        //Linea
                        Container(
                          color: ColorConstants.greyScale1,
                          height: 1,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: ColorConstants.greyScale1,
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          child: SizedBox(
                            height: 42,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.question_mark_outlined,
                                    color: ColorConstants.jazPalette5,
                                    size: 30,
                                  ),
                                  //const SizedBox(width: 50),
                                  Text(
                                    'Ayuda',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorConstants.greyScale2,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: ColorConstants.jazPalette5,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        //Linea
                        Container(
                          color: ColorConstants.greyScale1,
                          height: 1,
                        ),
                        const SizedBox(
                          height: 7,
                        ),

                        //Boton de Accesibilidad
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AccesibilityPage()));
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: ColorConstants.greyScale1,
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          child: SizedBox(
                            height: 42,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.accessibility_new_outlined,
                                    color: ColorConstants.jazPalette5,
                                    size: 30,
                                  ),
                                  //const SizedBox(width: 50),
                                  Text(
                                    'Accesibilidad',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorConstants.greyScale2,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: ColorConstants.jazPalette5,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        //Linea
                        Container(
                          color: ColorConstants.greyScale1,
                          height: 1,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        //Boton de Idiomas
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LeguagePage(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: ColorConstants.greyScale1,
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          child: SizedBox(
                            height: 42,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.language,
                                    color: ColorConstants.jazPalette5,
                                    size: 30,
                                  ),
                                  //const SizedBox(width: 50),
                                  Text(
                                    'Idioma',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorConstants.greyScale2,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: ColorConstants.jazPalette5,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        //Linea
                        Container(
                          color: ColorConstants.greyScale1,
                          height: 1,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SupportPage(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: ColorConstants.greyScale1,
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          child: SizedBox(
                            height: 42,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.contact_support_outlined,
                                    color: ColorConstants.jazPalette5,
                                    size: 30,
                                  ),
                                  //const SizedBox(width: 50),
                                  Text(
                                    'Soporte',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorConstants.greyScale2,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: ColorConstants.jazPalette5,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        //Linea
                        Container(
                          color: ColorConstants.greyScale1,
                          height: 1,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        OutlinedButton(
                          onPressed: () async {
                            bool userConfirmed = false;
                            await CoolAlert.show(
                              context: context,
                              type: CoolAlertType.confirm,
                              title: 'Cerrar Sesion',
                              text: "Seguro que quieres Cerrar Sesion?",
                              confirmBtnText: 'Yes',
                              cancelBtnText: 'No',
                              backgroundColor: ColorConstants.jazPalette3,
                              confirmBtnColor: ColorConstants.saidInactive,
                              onConfirmBtnTap: () async {
                                userConfirmed = true;
                                if (userConfirmed) {
                                  try {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    DocumentSnapshot groupDoc =
                                        await FirebaseFirestore.instance
                                            .collection('groups')
                                            .doc('MIsjzD')
                                            .get();

                                    if (groupDoc.exists) {
                                      await groupDoc.reference.update({
                                        'members':
                                            FieldValue.arrayRemove([userId]),
                                        'membersInfo.$userId':
                                            FieldValue.delete(),
                                      });
                                      await prefs.clear();
                                      await GoogleAuthService()
                                          .signOutWithGoogle();
                                    }

                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => const LoginPage(),
                                      ),
                                    );
                                  } catch (error) {
                                    print('No fue posible cerrar sesión');
                                  }
                                }
                              },
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: ColorConstants.greyScale1,
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          child: SizedBox(
                            height: 42,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.logout_outlined,
                                    color: ColorConstants.jazPalette5,
                                    size: 30,
                                  ),
                                  //const SizedBox(width: 50),
                                  Text(
                                    'Cerrar Sesión',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorConstants.greyScale2,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: ColorConstants.jazPalette5,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Text(
                          'Version 1.2.3.4.5',
                          style: TextStyle(
                              color: ColorConstants.greyScale2, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Copyright 2023 Kalan, Inc.',
                          style: TextStyle(
                              color: ColorConstants.greyScale2, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
