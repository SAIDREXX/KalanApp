import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/colors.dart';

class FollowingButton extends StatefulWidget {
  final int index;
  const FollowingButton({required this.index, super.key});

  @override
  State<FollowingButton> createState() => _FollowingButtonState();
}

class _FollowingButtonState extends State<FollowingButton> {
  late String groupName;
  late User? user;
  int index = 0;
  @override
  void initState() {
    super.initState();
    index = widget.index;
    user = FirebaseAuth.instance.currentUser;
    loadGroupName();
  }

  void loadGroupName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      groupName = prefs.getString('groupName') ?? user!.uid.substring(0, 6);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      child: Container(
        height: 50,
        width: width / 1.1,
        decoration: BoxDecoration(
          color: ColorConstants.jazPalette6,
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

                          List<String> familyNames = [];
                          for (var entry in memberEntries) {
                            String name = entry.value['name'];
                            familyNames.add(name);
                          }
                          print(familyNames);
                          return SizedBox(
                            width: width / 1.9,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                familyNames[index],
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: ColorConstants.jazPalette2,
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          );
                        }
                        return const CircularProgressIndicator();
                      },
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
/* SizedBox(
                      width: width / 1.9,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          'Hola',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: ColorConstants.jazPalette2,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),*/