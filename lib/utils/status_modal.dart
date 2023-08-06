import 'package:flutter/material.dart';
import 'package:kalanapp/constants/colors.dart';

class StatusModal extends StatefulWidget {
  final void Function(int) onStatusSelected;
  const StatusModal({required this.onStatusSelected, super.key});

  @override
  State<StatusModal> createState() => _StatusModalState();
}

class _StatusModalState extends State<StatusModal> {
  int statusSelected = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width / 1.1,
      height: height / 1.8,
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: ColorConstants.jazPalette4,
        borderRadius: BorderRadius.circular(32),
        image: const DecorationImage(
            image: AssetImage('assets/MayanBackground5.png'),
            fit: BoxFit.cover),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Establecer Estado',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 22,
            ),
            SizedBox(
              width: width / 1.4,
              height: 42,
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    statusSelected = 0;
                  });
                  widget.onStatusSelected(statusSelected);
                  Navigator.pop(context);
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32),
                  ),
                  side: BorderSide(color: ColorConstants.jazPalette3, width: 1),
                ),
                child: SizedBox(
                  height: 42,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.do_not_disturb_rounded,
                          color: ColorConstants.jazPalette5,
                          size: 30,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Ninguno',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorConstants.greyScale2,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.arrow_forward_ios,
                              color: ColorConstants.jazPalette5,
                              size: 20,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
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
              width: width / 1.4,
            ),
            const SizedBox(
              height: 7,
            ),
            SizedBox(
              width: width / 1.4,
              height: 42,
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    statusSelected = 1;
                  });
                  widget.onStatusSelected(statusSelected);
                  Navigator.pop(context);
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32),
                  ),
                  side: BorderSide(color: ColorConstants.jazPalette3, width: 1),
                ),
                child: SizedBox(
                  height: 42,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.route_outlined,
                          color: ColorConstants.jazPalette5,
                          size: 30,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Calle',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorConstants.greyScale2,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.arrow_forward_ios,
                              color: ColorConstants.jazPalette5,
                              size: 20,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
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
              width: width / 1.4,
            ),
            const SizedBox(
              height: 7,
            ),
            SizedBox(
              width: width / 1.4,
              height: 42,
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    statusSelected = 2;
                  });
                  widget.onStatusSelected(statusSelected);
                  Navigator.pop(context);
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32),
                  ),
                  side: BorderSide(color: ColorConstants.jazPalette3, width: 1),
                ),
                child: SizedBox(
                  height: 42,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.home_outlined,
                          color: ColorConstants.jazPalette5,
                          size: 30,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Casa',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorConstants.greyScale2,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.arrow_forward_ios,
                              color: ColorConstants.jazPalette5,
                              size: 20,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
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
              width: width / 1.4,
            ),
            const SizedBox(
              height: 7,
            ),
            SizedBox(
              width: width / 1.4,
              height: 42,
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    statusSelected = 3;
                  });
                  widget.onStatusSelected(statusSelected);
                  Navigator.pop(context);
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32),
                  ),
                  side: BorderSide(color: ColorConstants.jazPalette3, width: 1),
                ),
                child: SizedBox(
                  height: 42,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.school_outlined,
                          color: ColorConstants.jazPalette5,
                          size: 30,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Escuela',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorConstants.greyScale2,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.arrow_forward_ios,
                              color: ColorConstants.jazPalette5,
                              size: 20,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
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
              width: width / 1.4,
            ),
            const SizedBox(
              height: 7,
            ),
            SizedBox(
              width: width / 1.4,
              height: 42,
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    statusSelected = 4;
                  });
                  widget.onStatusSelected(statusSelected);
                  Navigator.pop(context);
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32),
                  ),
                  side: BorderSide(color: ColorConstants.jazPalette3, width: 1),
                ),
                child: SizedBox(
                  height: 42,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.liquor_outlined,
                          color: ColorConstants.jazPalette5,
                          size: 30,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Fiesta',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorConstants.greyScale2,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.arrow_forward_ios,
                              color: ColorConstants.jazPalette5,
                              size: 20,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
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
              width: width / 1.4,
            ),
            const SizedBox(
              height: 7,
            ),
            SizedBox(
              width: width / 1.4,
              height: 42,
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    statusSelected = 5;
                  });
                  widget.onStatusSelected(statusSelected);
                  Navigator.pop(context);
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32),
                  ),
                  side: BorderSide(color: ColorConstants.jazPalette3, width: 1),
                ),
                child: SizedBox(
                  height: 42,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.business_center_outlined,
                          color: ColorConstants.jazPalette5,
                          size: 30,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Trabajo',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorConstants.greyScale2,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.arrow_forward_ios,
                              color: ColorConstants.jazPalette5,
                              size: 20,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
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
              width: width / 1.4,
            ),
            const SizedBox(
              height: 7,
            ),
            SizedBox(
              width: width / 1.4,
              height: 42,
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    statusSelected = 6;
                  });
                  widget.onStatusSelected(statusSelected);
                  Navigator.pop(context);
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32),
                  ),
                  side: BorderSide(color: ColorConstants.jazPalette3, width: 1),
                ),
                child: SizedBox(
                  height: 42,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.local_taxi_outlined,
                          color: ColorConstants.jazPalette5,
                          size: 30,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Transporte',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorConstants.greyScale2,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.arrow_forward_ios,
                              color: ColorConstants.jazPalette5,
                              size: 20,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
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
              width: width / 1.4,
            ),
            const SizedBox(
              height: 7,
            ),
            SizedBox(
              width: width / 1.4,
              height: 42,
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    statusSelected = 7;
                  });
                  widget.onStatusSelected(statusSelected);
                  Navigator.pop(context);
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32),
                  ),
                  side: BorderSide(color: ColorConstants.jazPalette3, width: 1),
                ),
                child: SizedBox(
                  height: 42,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.signal_cellular_alt_2_bar_rounded,
                          color: ColorConstants.jazPalette5,
                          size: 30,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Zona sin cobretura',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorConstants.greyScale2,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.arrow_forward_ios,
                              color: ColorConstants.jazPalette5,
                              size: 20,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
