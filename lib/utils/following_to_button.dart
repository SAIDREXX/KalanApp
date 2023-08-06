import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class FollowingButton extends StatefulWidget {
  const FollowingButton({super.key});

  @override
  State<FollowingButton> createState() => _FollowingButtonState();
}

class _FollowingButtonState extends State<FollowingButton> {
  final userName = FirebaseAuth.instance.currentUser!.displayName;
  String userNameNotNull = '';

  @override
  void initState() {
    super.initState();
    if (userName != null) {
      userNameNotNull = userName ?? 'Usuario Sin Nombre';
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      child: Container(
        height: 50,
        width: width / 1.1,
        decoration: BoxDecoration(
          color: ColorConstants.jazPalette10,
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
                      child: Text(
                        'Siguiendo A:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorConstants.jazPalette2,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: width / 1.9,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          userNameNotNull,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: ColorConstants.jazPalette2,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
