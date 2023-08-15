import 'package:flutter/material.dart';

import '../constants/colors.dart';

class PermissionAlert extends StatefulWidget {
  const PermissionAlert({super.key});

  @override
  State<PermissionAlert> createState() => _PermissionAlertState();
}

class _PermissionAlertState extends State<PermissionAlert> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width / 1.1,
      height: height / 4,
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '¿Está usted en peligro?',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.5,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Confirmar esta acción alertará a tus contactos',
            style: TextStyle(
                color: ColorConstants.greyScale2,
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 40,
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
                      fontSize: 18,
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
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
