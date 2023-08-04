import 'package:flutter/material.dart';
import 'package:kalanapp/constants/colors.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
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
                              'Contactos de Emergencia',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 22,
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
                                      padding: const EdgeInsets.only(left: 7),
                                      child: Icon(
                                        Icons.person_outline,
                                        color: ColorConstants.jazPalette5,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      'Contacto 1',
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
                                              print('Touch');
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
                                      padding: const EdgeInsets.only(left: 7),
                                      child: Icon(
                                        Icons.person_outline,
                                        color: ColorConstants.jazPalette5,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      'Contacto 2',
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
                                              print('Touch');
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
                                      padding: const EdgeInsets.only(left: 7),
                                      child: Icon(
                                        Icons.person_outline,
                                        color: ColorConstants.jazPalette5,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      'Contacto 3',
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
                                              print('Touch');
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
                                      padding: const EdgeInsets.only(left: 7),
                                      child: Icon(
                                        Icons.person_outline,
                                        color: ColorConstants.jazPalette5,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      'Contacto 4',
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
                                              print('Touch');
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
                                      padding: const EdgeInsets.only(left: 7),
                                      child: Icon(
                                        Icons.person_outline,
                                        color: ColorConstants.jazPalette5,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      'Contacto 5',
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
                                              print('Touch');
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
                                      padding: const EdgeInsets.only(left: 7),
                                      child: Icon(
                                        Icons.person_outline,
                                        color: ColorConstants.jazPalette5,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      'Contacto 6',
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
                                              print('Touch');
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
                                      padding: const EdgeInsets.only(left: 7),
                                      child: Icon(
                                        Icons.person_outline,
                                        color: ColorConstants.jazPalette5,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      'Contacto 7',
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
                                              print('Touch');
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
                                      padding: const EdgeInsets.only(left: 7),
                                      child: Icon(
                                        Icons.person_outline,
                                        color: ColorConstants.jazPalette5,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      'Contacto 8',
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
                                              print('Touch');
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
                                      padding: const EdgeInsets.only(left: 7),
                                      child: Icon(
                                        Icons.person_outline,
                                        color: ColorConstants.jazPalette5,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      'Contacto 9',
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
                                              print('Touch');
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
                                      padding: const EdgeInsets.only(left: 7),
                                      child: Icon(
                                        Icons.person_outline,
                                        color: ColorConstants.jazPalette5,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      'Contacto 10',
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
                                              print('Touch');
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
                    ),
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
