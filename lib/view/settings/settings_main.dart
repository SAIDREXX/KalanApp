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
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70,
                    child: Image.asset('assets/splash.png'),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Conecta, Protege y Comparte con Kalan',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: height / 1.9,
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.cancel_outlined,
                                size: 25,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Ajustes',
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.w500),
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
                                  inactiveTrackColor:
                                      ColorConstants.jazPalette2,
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
                          Container(
                              width: 100,
                              height: 42,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(32),
                                border: Border.all(
                                  color: ColorConstants.greyScale4,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: Icon(
                                      Icons.person_2_outlined,
                                      color: ColorConstants.jazPalette3,
                                      size: 28,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Cuenta',
                                          style: TextStyle(
                                              color: ColorConstants.jazPalette2,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
