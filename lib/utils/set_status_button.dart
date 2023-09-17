import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kalanapp/utils/status_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/colors.dart';

class StatusButton extends StatefulWidget {
  final int userIndex;

  const StatusButton({required this.userIndex, super.key});

  @override
  State<StatusButton> createState() => _StatusButtonState();
}

class _StatusButtonState extends State<StatusButton> {
  late String groupName;
  late User? user;
  late int userIndex;
  late int accountIndex;
  late String accountName;
  int statusSelected = 0;
  List<String> deviceTokens = [];
  List<String> statusOptionsFist = [
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
  void initState() {
    super.initState();
    userIndex = widget.userIndex;
    loadGroupName();
  }

  void loadGroupName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user = FirebaseAuth.instance.currentUser;
    setState(() {
      groupName = prefs.getString('groupName') ?? user!.uid.substring(0, 6);
      accountIndex = prefs.getInt('groupPosition') ?? 0;
      accountName = prefs.getString('userName') ?? 'Sin Nombre';
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final user = FirebaseAuth.instance.currentUser;
    String userId = user!.uid;
    return GestureDetector(
      onTap: () {
        if (userIndex == accountIndex) {
          showDialog(
            context: context,
            builder: (context) {
              return Center(
                child: StatusModal(
                  onStatusSelected: (selectedStatus) async {
                    setState(() {
                      statusSelected = selectedStatus;
                    });
                    DocumentSnapshot groupDoc = await FirebaseFirestore.instance
                        .collection('groups')
                        .doc(groupName)
                        .get();

                    if (groupDoc.exists) {
                      await groupDoc.reference.update({
                        'membersInfo.$userId.currentStatus': selectedStatus,
                      });

                      setState(() {});
                    }
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
                      StreamBuilder<DocumentSnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('groups')
                            .doc(groupName)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: ColorConstants.jazPalette3,
                              ),
                            );
                          }

                          if (snapshot.hasData) {
                            Map<String, dynamic> membersInfo =
                                snapshot.data!['membersInfo'];

                            List<MapEntry<String, dynamic>> memberEntries =
                                membersInfo.entries.toList();

                            memberEntries.sort((a, b) {
                              Timestamp timestampA = a.value['joinTimestamp'];
                              Timestamp timestampB = b.value['joinTimestamp'];
                              return timestampA.compareTo(timestampB);
                            });
                            List<String> accountsName = [];
                            List<int> statusNumber = [];

                            for (var entry in memberEntries) {
                              int status = entry.value['currentStatus'];
                              String deviceToken = entry.value['deviceToken'];
                              deviceTokens.add(deviceToken);
                              statusNumber.add(status);
                              accountsName.add(accountName);
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

                            return Center(
                              child: Text(
                                statusOptions[statusNumber[userIndex]],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorConstants.jazPalette3,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            );
                          }

                          return Center(
                            child: CircularProgressIndicator(
                              color: ColorConstants.paletteColor2,
                            ),
                          );
                        },
                      ),
                      const Spacer(),
                      userIndex != accountIndex
                          ? const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: 15,
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.transparent,
                                    size: 20,
                                  ),
                                ),
                              ],
                            )
                          : Row(
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
