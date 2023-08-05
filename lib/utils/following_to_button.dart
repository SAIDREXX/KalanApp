import 'package:flutter/material.dart';

import '../constants/colors.dart';

class FollowingButton extends StatefulWidget {
  const FollowingButton({super.key});

  @override
  State<FollowingButton> createState() => _FollowingButtonState();
}

class _FollowingButtonState extends State<FollowingButton> {
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
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print('Right Arrow Touched');
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: ColorConstants.jazPalette2,
                            size: 20,
                          ),
                        ),
                        Text(
                          'Ester Exposito  ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorConstants.jazPalette2,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Inter',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 15,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              print('Left Arrow Touched');
                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: ColorConstants.jazPalette2,
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
    );
  }
}
