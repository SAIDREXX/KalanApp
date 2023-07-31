import 'package:flutter/material.dart';
import 'package:kalanapp/constants/colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

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
                    SizedBox(
                      child: Icon(
                        Icons.settings,
                        size: 150,
                        color: ColorConstants.jazPalette4,
                      ),
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
                            const Icon(
                              Icons.close,
                              size: 25,
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
                            const SizedBox(
                              width: 5,
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
                            const SizedBox(
                              width: 1,
                            ),
                            const Icon(
                              Icons.nightlight_outlined,
                              size: 25,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
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
                                    '',
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.sensor_door_outlined,
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
