import 'package:flutter/material.dart';
import 'package:kalanapp/constants/colors.dart';
import 'package:kalanapp/utils/upload_file_modal.dart';

class SecureFolderPage extends StatefulWidget {
  const SecureFolderPage({super.key});

  @override
  State<SecureFolderPage> createState() => _SecureFolderPageState();
}

class _SecureFolderPageState extends State<SecureFolderPage> {
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
                              'Carpeta Segura',
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
                                      padding: const EdgeInsets.only(
                                          left: 7, right: 7),
                                      child: Icon(
                                        Icons.my_library_books_outlined,
                                        color: ColorConstants.jazPalette5,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      'Acta de Nacimiento',
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
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return const Center(
                                                      child: UploadFileModal(),
                                                    );
                                                  });
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
                                        Icons.person_add_alt_outlined,
                                        color: ColorConstants.jazPalette5,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      'CURP',
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
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return const Center(
                                                      child: UploadFileModal(),
                                                    );
                                                  });
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
                                        Icons.perm_contact_calendar_outlined,
                                        color: ColorConstants.jazPalette5,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      'Identificación Oficial',
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
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return const Center(
                                                      child: UploadFileModal(),
                                                    );
                                                  });
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
                                        Icons.medical_services_outlined,
                                        color: ColorConstants.jazPalette5,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      'Información Médica',
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
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return const Center(
                                                      child: UploadFileModal(),
                                                    );
                                                  });
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
                                        Icons.airplanemode_active_outlined,
                                        color: ColorConstants.jazPalette5,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      'Pasaporte',
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
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return const Center(
                                                      child: UploadFileModal(),
                                                    );
                                                  });
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
                                        Icons.credit_card_outlined,
                                        color: ColorConstants.jazPalette5,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      'VISA Americana',
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
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return const Center(
                                                      child: UploadFileModal(),
                                                    );
                                                  });
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
