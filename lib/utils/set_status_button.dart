import 'package:flutter/material.dart';

import '../constants/colors.dart';

class StatusButton extends StatefulWidget {
  const StatusButton({super.key});

  @override
  State<StatusButton> createState() => _StatusButtonState();
}

class _StatusButtonState extends State<StatusButton> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        print('Button Pushed');
      },
      child: InkWell(
        child: Container(
          height: 42,
          width: width / 1.5,
          decoration: BoxDecoration(
            color: ColorConstants.jazPalette4,
            image: const DecorationImage(
              image: AssetImage('assets/MayanBackground5.png'),
              fit: BoxFit.cover, // Ajustar la imagen al tamaño del botón
            ),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Stack(
            alignment: Alignment.center, // Alineamos el contenido en el centro
            children: [
              SizedBox(
                height: 42,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Icon(
                          Icons.stream,
                          color: ColorConstants.jazPalette3,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Estado',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorConstants.jazPalette3,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 15,
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: ColorConstants.jazPalette3,
                              size: 20,
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
    );
  }
}
