import 'package:flutter/material.dart';
import 'package:kalanapp/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpNumbersPage extends StatefulWidget {
  const HelpNumbersPage({super.key});

  @override
  State<HelpNumbersPage> createState() => _HelpNumbersPageState();
}

void emergencyNumbersCall(int index) async {
  List<String> emergencyNumbers = [
    '+522292002271',
    '+522292002271',
    '+522299234400',
    '+522299314000',
    '+522299222646',
    '+522299224148'
        '+522731230139',
  ];
  Uri numberToCall = Uri(scheme: 'tel', path: emergencyNumbers[index]);
  await launchUrl(numberToCall);
}

class _HelpNumbersPageState extends State<HelpNumbersPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorConstants.jazPalette4,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70,
                    child: Image.asset('assets/kalan_logo_full.png'),
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
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
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
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Números de Emergencia',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              '(Veracruz)',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              height: 40,
                              width: 280,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(width: 1, color: Colors.black),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: SizedBox(
                                height: 42,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 7, right: 7),
                                      child: Icon(
                                        Icons.fire_truck_outlined,
                                        color: ColorConstants.jazPalette5,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      'Bomberos',
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
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 7),
                                          child: GestureDetector(
                                            onTap: () {
                                              emergencyNumbersCall(0);
                                            },
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: ColorConstants.jazPalette5,
                                              size: 20,
                                            ),
                                          ),
                                        ),
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
                            Container(
                              height: 40,
                              width: 280,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(width: 1, color: Colors.black),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: SizedBox(
                                height: 42,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 7, right: 7),
                                      child: Icon(
                                        Icons.healing_outlined,
                                        color: ColorConstants.jazPalette5,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      'Centro de Salud',
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
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 7),
                                          child: GestureDetector(
                                            onTap: () {
                                              emergencyNumbersCall(1);
                                            },
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: ColorConstants.jazPalette5,
                                              size: 20,
                                            ),
                                          ),
                                        ),
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
                            Container(
                              height: 40,
                              width: 280,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(width: 1, color: Colors.black),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: SizedBox(
                                height: 42,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 7, right: 7),
                                      child: Icon(
                                        Icons.health_and_safety_outlined,
                                        color: ColorConstants.jazPalette5,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      'Cruz Roja',
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
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 7),
                                          child: GestureDetector(
                                            onTap: () {
                                              emergencyNumbersCall(2);
                                            },
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: ColorConstants.jazPalette5,
                                              size: 20,
                                            ),
                                          ),
                                        ),
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
                            Container(
                              height: 40,
                              width: 280,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(width: 1, color: Colors.black),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: SizedBox(
                                height: 42,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 7, right: 7),
                                      child: Icon(
                                        Icons.local_hospital_outlined,
                                        color: ColorConstants.jazPalette5,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      'Hospital',
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
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 7),
                                          child: GestureDetector(
                                            onTap: () {
                                              emergencyNumbersCall(3);
                                            },
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: ColorConstants.jazPalette5,
                                              size: 20,
                                            ),
                                          ),
                                        ),
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
                            Container(
                              height: 40,
                              width: 280,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(width: 1, color: Colors.black),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: SizedBox(
                                height: 42,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 7, right: 7),
                                      child: Icon(
                                        Icons.vaccines_outlined,
                                        color: ColorConstants.jazPalette5,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      'IMSS',
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
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 7),
                                          child: GestureDetector(
                                            onTap: () {
                                              emergencyNumbersCall(4);
                                            },
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: ColorConstants.jazPalette5,
                                              size: 20,
                                            ),
                                          ),
                                        ),
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
                            Container(
                              height: 40,
                              width: 280,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(width: 1, color: Colors.black),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: SizedBox(
                                height: 42,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 7, right: 7),
                                      child: Icon(
                                        Icons.local_police_outlined,
                                        color: ColorConstants.jazPalette5,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      'Policia',
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
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 7),
                                          child: GestureDetector(
                                            onTap: () {
                                              emergencyNumbersCall(5);
                                            },
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: ColorConstants.jazPalette5,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
