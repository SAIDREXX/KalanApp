//Código funcionando pero no actualiza en tiempo real si alguien entra o sale del grupo

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kalanapp/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactsNavBar extends StatefulWidget {
  final Function(int) onItemTapped;
  final Function(int) onLongPress;
  final Function(int) onItemSelected;

  const ContactsNavBar(
      {required this.onItemTapped,
      required this.onLongPress,
      required this.onItemSelected,
      super.key});

  @override
  State<ContactsNavBar> createState() => _ContactsNavBarState();
}

class _ContactsNavBarState extends State<ContactsNavBar> {
  late SharedPreferences prefs;
  late User? user;
  late String currentGroup;
  late CollectionReference groupCollection;
  late int membersCount;
  int selectedIndex = 0;
  List<String> profileImageUrls = [];

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    loadSharedPreferences();
    membersCount = 0;
    loadMembersCount();
  }

  Future<int> getMembersCount(String userGroupIdentifier) async {
    DocumentSnapshot groupSnapshot = await FirebaseFirestore.instance
        .collection('groups')
        .doc(userGroupIdentifier)
        .get();

    if (groupSnapshot.exists) {
      Map<String, dynamic> groupData =
          groupSnapshot.data() as Map<String, dynamic>;
      List<dynamic> members = groupData['members'];

      int memberCount = members.length;
      return memberCount;
    } else {
      // El documento no existe
      return 0;
    }
  }

  Future<void> loadMembersCount() async {
    prefs = await SharedPreferences.getInstance();
    String userGroupIdentifier =
        prefs.getString('groupName') ?? user!.uid.substring(0, 6);
    int count = await getMembersCount(userGroupIdentifier);
    setState(() {
      membersCount = count;
    });
  }

  Future<void> loadSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    groupCollection = FirebaseFirestore.instance.collection('groups');

    setState(() {
      currentGroup = prefs.getString('groupName') ?? user!.uid.substring(0, 6);
    });
  }

  Stream<DocumentSnapshot> loadProfilePictureStream() {
    return groupCollection.doc(currentGroup).snapshots();
  }

  Future<void> loadProfileImages() async {
    try {
      DocumentSnapshot groupSnapshot =
          await groupCollection.doc(currentGroup).get();
      Map<String, dynamic> membersInfo = groupSnapshot['membersInfo'];
      List<String> memberIds = groupSnapshot['members'].cast<String>();

      // Populate profileImageUrls list with profile picture URLs
      for (String memberId in memberIds) {
        String profileImageUrl = membersInfo[memberId]['pictureURL'];
        profileImageUrls.add(profileImageUrl);
      }
    } catch (error) {
      print('Error loading profile images: $error');
    }
  }

  void onItemTapped(int index) {
    setState(() {});
  }

  void onLongPress(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

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
        child: FutureBuilder(
          future: loadProfileImages(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  ...List.generate(membersCount, (index) {
                    return GestureDetector(
                      onTap: () {
                        widget.onItemSelected(index);
                        widget.onItemTapped(index);
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      onLongPress: () {
                        widget.onLongPress(index);
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            height: 60,
                            width: 30,
                            decoration: BoxDecoration(
                                border: index == selectedIndex
                                    ? Border(
                                        bottom: BorderSide(
                                          width: 3,
                                          color: ColorConstants.jazPalette3,
                                        ),
                                      )
                                    : null),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: ClipOval(
                                    child: Image.network(
                                      profileImageUrls[index],
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(
                    width: 12,
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
