import 'package:flutter/material.dart';
import 'package:kalanapp/constants/colors.dart';

class SOSPage extends StatelessWidget {
  const SOSPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
        children: [
          const Text(
            '¿Está usted en peligro?',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.5,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Confirmar esta acción alertará a tus contactos',
            style: TextStyle(
                color: ColorConstants.greyScale2,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 64,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 140,
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                    side: const BorderSide(color: Colors.white, width: 1.5),
                  ),
                  height: 40,
                  child: const Text(
                    'S.O.S',
                    style: TextStyle(
                      fontSize: 18, // Ajusta el tamaño de fuente aquí
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 140,
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                    side: const BorderSide(color: Colors.white, width: 1.5),
                  ),
                  height: 40,
                  child: const Text(
                    'Falsa alarma',
                    style: TextStyle(
                      fontSize: 18, // Ajusta el tamaño de fuente aquí
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
