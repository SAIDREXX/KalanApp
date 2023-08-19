import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kalanapp/utils/profile_picture_list.dart';
import '../constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactsNavBarKalan extends StatefulWidget {
  final Function(int) onItemTapped;
  final Function(int) onLongPress;
  final Function(int) onItemSelected;
  final int index;
  const ContactsNavBarKalan(
      {required this.onItemTapped,
      required this.onLongPress,
      required this.onItemSelected,
      required this.index,
      super.key});

  @override
  State<ContactsNavBarKalan> createState() => _ContactsNavBarKalanState();
}

class _ContactsNavBarKalanState extends State<ContactsNavBarKalan> {
  late String groupName;
  late Future<void> initData;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    initData = loadGroupName();
  }

  Future<void> loadGroupName() async {
    User? user = FirebaseAuth.instance.currentUser;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedIndex = widget.index;
    setState(() {
      groupName = prefs.getString('groupName') ?? user!.uid.substring(0, 6);
    });
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void onLongPress(int index) {
    setState(() {
      selectedIndex = index;
      print('El index presionado es :$selectedIndex');
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: initData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: ColorConstants.jazPalette3,
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        return Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(32),
          color: ColorConstants.jazPalette4,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/MayanBackground5.png'),
                  fit: BoxFit.cover),
            ),
            height: 60,
            width: width / 1.15,
            child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('groups')
                  .doc(groupName)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (!snapshot.hasData || !snapshot.data!.exists) {
                  return const Center(child: Text('No data available'));
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

                  List<Widget> profilePictures = [];

                  memberEntries.forEach((memberEntry) {
                    String pictureURL = memberEntry.value['pictureURL'];
                    profilePictures.add(ProfilePicturesList(
                      imagePath: pictureURL,
                    ));
                  });

                  return Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Contactos',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: profilePictures.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(6),
                              child: GestureDetector(
                                onTap: () {
                                  widget.onItemSelected(index);
                                  widget.onItemTapped(index);
                                  setState(() {
                                    selectedIndex = index;
                                    print('El index presionado es: $index');
                                  });
                                },
                                onLongPress: () {
                                  widget.onLongPress(index);
                                  setState(() {
                                    print(
                                        'El index presionado mucho tiempo es: $index');
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 250),
                                  height: 60,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    border: index == selectedIndex
                                        ? Border(
                                            bottom: BorderSide(
                                              width: 3,
                                              color: ColorConstants.jazPalette3,
                                            ),
                                          )
                                        : null,
                                  ),
                                  child: profilePictures[index],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  );
                }
                return Center(
                  child: CircularProgressIndicator(
                    color: ColorConstants.jazPalette3,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
