import 'package:flutter/material.dart';
import 'package:kalanapp/constants/colors.dart';

class MaterialButtonWithTextureAndText extends StatelessWidget {
  final String text;
  const MaterialButtonWithTextureAndText({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Acción a realizar cuando se presiona el botón
        print('Botón con textura y texto presionado');
      },
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          color: ColorConstants.jazPalette3,
          image: const DecorationImage(
            image: AssetImage('assets/MayanBackground5.png'),
            fit: BoxFit.cover, // Ajustar la imagen al tamaño del botón
          ),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Stack(
          alignment: Alignment.center, // Alineamos el contenido en el centro
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
