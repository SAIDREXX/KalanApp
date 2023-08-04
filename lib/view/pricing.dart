import 'package:flutter/material.dart';
import 'package:kalanapp/constants/colors.dart';
import 'package:kalanapp/home_screen.dart';
import 'package:kalanapp/utils/button_with_texture.dart';
import 'package:kalanapp/utils/rounded_container_text.dart';
import 'package:kalanapp/utils/price_options_icon.dart';
import 'package:kalanapp/utils/price_options_text.dart';
import 'package:kalanapp/utils/sos_modal.dart';
import 'package:kalanapp/view/gridTabs/contacts.dart';
import 'package:kalanapp/view/secure_folder.dart';

class PricingPage extends StatefulWidget {
  const PricingPage({super.key});

  @override
  State<PricingPage> createState() => _PricingPageState();
}

class _PricingPageState extends State<PricingPage> {
  int selectedPricedIndex = 0;
  int currentIndex = 2;
  double screenHeight = 1.5;

  void selectPrice(int index) {
    setState(() {
      selectedPricedIndex = index;
    });
  }

  void onNavItemTapped(int indexNav) {
    setState(() {
      currentIndex = indexNav;
    });
    switch (indexNav) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ContactsPage(),
          ),
        );
        break;
      case 2:
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SecureFolderPage(),
          ),
        );
        break;
      case 4:
        showDialog(
            context: context,
            builder: (BuildContext context) {
              final screenHeight = MediaQuery.of(context).size.height;
              return Center(
                child: SizedBox(
                  width: double.infinity,
                  height: screenHeight / 3,
                  child: const SOSPage(),
                ),
              );
            });
        break;
    }
  }

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
                SingleChildScrollView(
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
                            const Text(
                              'Membresía',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 281,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1, color: Colors.black),
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      PriceOption(
                                        isSelected: selectedPricedIndex == 0,
                                        icon: Icons.people_outline,
                                        onSelect: () => selectPrice(0),
                                      ),
                                      PriceOption(
                                        isSelected: selectedPricedIndex == 1,
                                        icon: Icons.groups_2_outlined,
                                        onSelect: () => selectPrice(1),
                                      ),
                                      PriceOption(
                                        isSelected: selectedPricedIndex == 2,
                                        icon: Icons.menu_book_sharp,
                                        onSelect: () => selectPrice(2),
                                      ),
                                    ],
                                  ),
                                )
                              ],
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
                            RoundedContainer(
                              child: buildSelectedText(selectedPricedIndex),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 281,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1, color: Colors.black),
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      PriceOptionText(
                                        isSelected: selectedPricedIndex == 0,
                                        price: "\$7 USD",
                                        onSelect: () => selectPrice(0),
                                      ),
                                      PriceOptionText(
                                        isSelected: selectedPricedIndex == 1,
                                        price: "\$10 USD",
                                        onSelect: () => selectPrice(1),
                                      ),
                                      PriceOptionText(
                                        isSelected: selectedPricedIndex == 2,
                                        price: "\$3.5 USD",
                                        onSelect: () => selectPrice(2),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),

                            const SizedBox(
                              height: 40,
                            ),
                            const MaterialButtonWithTextureAndText(
                              text: 'Pedir y Pagar',
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget buildSelectedText(int selectedPricedIndex) {
  switch (selectedPricedIndex) {
    case 0:
      return const Text(
        '-Premium para 2 personas               -Hasta 2 contactos de confianza',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        // Otras propiedades de estilo para el primer texto
      );
    case 1:
      return const Text(
        '-Premium para 6 personas               -Hasta 10 contactos de confianza',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        // Otras propiedades de estilo para el primer texto
      );
    case 2:
      return const Text(
        '-Premium para 2 personas               -Hasta 5 contactos de confianza -Exclusivo para universitarios',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        // Otras propiedades de estilo para el primer texto
      );
    default:
      return const Text(
        'Si lograste ver este texto, reporta el bug. Muchas Gracias <3',
        // Otras propiedades de estilo para el texto predeterminado
      );
  }
}
