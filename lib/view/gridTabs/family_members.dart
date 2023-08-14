import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kalanapp/constants/colors.dart';
import 'package:kalanapp/utils/grid_family_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FamilyPage extends StatefulWidget {
  const FamilyPage({super.key});

  @override
  State<FamilyPage> createState() => _FamilyPageState();
}

class _FamilyPageState extends State<FamilyPage> {
  late String groupName;
  late User? user;
  bool isInGroup = false;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    loadGroupName();
  }

  void loadGroupName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      groupName = prefs.getString('groupName') ?? user!.uid.substring(0, 6);
    });
  }

  void updateGroupName(String newGroupName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('groupName', newGroupName);

    setState(() {
      groupName = newGroupName;
      print('Valor de GroupName en setState: $groupName');
      isInGroup = false;
    });
    await FirebaseFirestore.instance
        .collection('groups')
        .doc(groupName)
        .update({'groupName': newGroupName});
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    Widget getUserProfileImage() {
      if (user!.photoURL != null) {
        return ClipOval(
          child: Image.network(
            user!.photoURL!,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        );
      } else {
        return ClipOval(
          child: Image.asset(
            'assets/default_profile.png',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: ColorConstants.jazPalette2,
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                height: height / 2.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorConstants.jazPalette3,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                  image: const DecorationImage(
                    image: AssetImage('assets/MayanBackground5.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 70,
                      child: Image.asset('assets/kalan_logo_full.png'),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.notifications_none_outlined,
                      size: 50,
                      color: ColorConstants.jazPalette4,
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      child: SizedBox(
                        height: 42, // Ajusta el alto del botón aquí
                        child: MaterialButton(
                          onPressed: () {},
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                            side: const BorderSide(
                                color: Colors.white, width: 1.5),
                          ),
                          child: const Text(
                            'S.O.S',
                            style: TextStyle(
                              fontSize: 18, // Ajusta el tamaño de fuente aquí
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                    Container(
                      child: getUserProfileImage(),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: height / 1.4,
                          margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  'Grupo: $groupName',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: StreamBuilder<DocumentSnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('groups')
                                      .doc(groupName)
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      Map<String, dynamic> membersInfo =
                                          snapshot.data!['membersInfo'];

                                      List<Widget> familyItems = [];
                                      membersInfo
                                          .forEach((memberId, memberData) {
                                        String name = memberData['name'];
                                        String pictureURL =
                                            memberData['pictureURL'];

                                        familyItems.add(FamilyItem(
                                          imagePath: pictureURL,
                                          text: name,
                                          onPressed: () {},
                                        ));
                                      });
                                      if (familyItems.length > 1) {
                                        isInGroup = true;
                                      }

                                      return GridView.count(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 35,
                                        padding: const EdgeInsets.all(10),
                                        children: familyItems,
                                      );
                                    }
                                    return const CircularProgressIndicator();
                                  },
                                ),
                              ),
                              Container(
                                alignment: Alignment
                                    .bottomCenter, // Ajusta la alineación del botón
                                margin: const EdgeInsets.only(bottom: 0),
                                child: MaterialButton(
                                  onPressed: () {
                                    isInGroup
                                        ? showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Center(
                                                child: LeaveGroupModal(
                                                  updateGroupName:
                                                      updateGroupName,
                                                ),
                                              );
                                            },
                                          )
                                        : showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Center(
                                                child: JoinGroupModal(
                                                  updateGroupName:
                                                      updateGroupName,
                                                ),
                                              );
                                            },
                                          );
                                  },
                                  color: isInGroup
                                      ? Colors.red
                                      : ColorConstants.jazPalette3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                    side: const BorderSide(
                                        color: Colors.black, width: 1.5),
                                  ),
                                  child: Text(
                                    isInGroup
                                        ? 'Abandonar Grupo'
                                        : 'Unirse a Grupo',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class JoinGroupModal extends StatefulWidget {
  final Function(String) updateGroupName;
  const JoinGroupModal({required this.updateGroupName, super.key});

  @override
  State<JoinGroupModal> createState() => _JoinGroupModalState();
}

class _JoinGroupModalState extends State<JoinGroupModal> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    String userId = user!.uid;
    String? userName = user.displayName;
    String? userPhotoURL = user.photoURL;
    String userGroupIdentifier = userId.substring(0, 6);
    TextEditingController textFieldController = TextEditingController();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Container(
        width: width / 1.1,
        height: height / 3.5,
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
                'Unirse a Grupo',
                style: TextStyle(
                    fontSize: 23,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    decoration: TextDecoration.none),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 22,
              ),
              SizedBox(
                height: 42,
                child: TextField(
                  controller: textFieldController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    labelText: 'Código De Grupo',
                    contentPadding: const EdgeInsets.fromLTRB(20, 20, 15, 25),
                    prefixIcon: const Icon(Icons.group_add_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorConstants.jazPalette1),
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: width / 4,
                    child: MaterialButton(
                      onPressed: () async {
                        DocumentSnapshot groupDoc = await FirebaseFirestore
                            .instance
                            .collection('groups')
                            .doc(textFieldController.text)
                            .get();

                        if (groupDoc.exists) {
                          await groupDoc.reference.update({
                            'members': FieldValue.arrayUnion([userId]),
                            'membersInfo.$userId': {
                              'name': userName,
                              'pictureURL': userPhotoURL,
                            }
                          });
                          await FirebaseFirestore.instance
                              .collection('groups')
                              .doc(userGroupIdentifier)
                              .delete();
                          //Insertar Pantalla de Agregado con exito
                          widget.updateGroupName(textFieldController.text);
                          print(
                              'El valor de la variable group en el Modal es: $textFieldController.text');
                          Navigator.of(context).pop();
                        } else {
                          print('Error Al Añadir');
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      color: ColorConstants.jazPalette3,
                      child: const Text(
                        'Unirse',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: width / 4,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      color: Colors.red,
                      child: const Text(
                        'Volver',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LeaveGroupModal extends StatefulWidget {
  final Function(String) updateGroupName;
  const LeaveGroupModal({required this.updateGroupName, super.key});

  @override
  State<LeaveGroupModal> createState() => _LeaveGroupModalState();
}

class _LeaveGroupModalState extends State<LeaveGroupModal> {
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    String userId = user!.uid;
    String? userName = user.displayName;
    String? userPhotoURL = user.photoURL;
    String userGroupIdentifier = userId.substring(0, 6);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Container(
        width: width / 1.1,
        height: height / 3.5,
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
                'Abandonar Grupo',
                style: TextStyle(
                    fontSize: 23,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    decoration: TextDecoration.none),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 22,
              ),
              const Text(
                '¿Estás seguro de abandonar el grupo actual?',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    decoration: TextDecoration.none),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: width / 4,
                    child: MaterialButton(
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        DocumentSnapshot groupDoc = await FirebaseFirestore
                            .instance
                            .collection('groups')
                            .doc(prefs.getString('groupName'))
                            .get();

                        if (groupDoc.exists) {
                          await groupDoc.reference.update({
                            'members': FieldValue.arrayRemove([userId]),
                            'membersInfo.$userId': FieldValue.delete(),
                          });
                          await FirebaseFirestore.instance
                              .collection('groups')
                              .doc(userGroupIdentifier)
                              .set({
                            'creator': userId,
                            'members': [userId],
                            'membersInfo': {
                              userId: {
                                'name': userName,
                                'pictureURL': userPhotoURL,
                              },
                            },
                          });
                          //Insertar Pantalla de Agregado con exito
                          widget.updateGroupName(userGroupIdentifier);
                          print(
                              'El valor de la variable group en el Modal es: $userGroupIdentifier');
                          Navigator.of(context).pop();
                        } else {
                          print('Error Al Añadir');
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      color: ColorConstants.jazPalette3,
                      child: const Text(
                        'Salir',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: width / 4,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      color: Colors.red,
                      child: const Text(
                        'Volver',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
