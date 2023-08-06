import 'package:flutter/material.dart';
import 'package:kalanapp/utils/status_modal.dart';

import '../constants/colors.dart';

class StatusButton extends StatefulWidget {
  final int userIndex;
  const StatusButton({required this.userIndex, super.key});

  @override
  State<StatusButton> createState() => _StatusButtonState();
}

class _StatusButtonState extends State<StatusButton> {
  late int userIndex;

  int statusSelected = 0;

  @override
  void initState() {
    super.initState();
    userIndex = widget.userIndex;
  }

  List<String> statusOptions = [
    'Establecer Estado',
    'Calle',
    'Casa',
    'Escuela',
    'Fiesta',
    'Trabajo',
    'Transporte',
    'Zona sin cobertura'
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        if (userIndex == 0) {
          showDialog(
            context: context,
            builder: (context) {
              return Center(
                child: StatusModal(
                  onStatusSelected: (selectedStatus) {
                    setState(() {
                      statusSelected = selectedStatus;
                    });
                  },
                ),
              );
            },
          );
          print('Current Index: 0');
        } else {
          print('Current Index: $userIndex');
        }
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
                        statusOptions[statusSelected],
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
