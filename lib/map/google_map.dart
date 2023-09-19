
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kalanapp/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:location/location.dart';

class GoogleMapsMaps extends StatefulWidget {
  final int userIndex;
  const GoogleMapsMaps({required this.userIndex, super.key});

  @override
  State<GoogleMapsMaps> createState() => _GoogleMapsMapsState();
}

class _GoogleMapsMapsState extends State<GoogleMapsMaps> {
  GoogleMapController? mapController;
  late String groupName;
  late User? user;
  Location location = Location();
  late LatLng userLocation = const LatLng(0, 0);

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    loadGroupName();
    listenForLocationChanges();
  }

  void listenForLocationChanges() {
    location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        userLocation = LatLng(
            currentLocation.latitude ?? 0, currentLocation.longitude ?? 0);
      });
    });
  }

  void loadGroupName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      groupName = prefs.getString('groupName') ?? user!.uid.substring(0, 6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('groups')
          .doc(groupName)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: ColorConstants.jazPalette3,
            ),
          );
        }

        if (snapshot.hasData) {
          Map<String, dynamic> membersInfo = snapshot.data!['membersInfo'];

          List<MapEntry<String, dynamic>> memberEntries =
              membersInfo.entries.toList();

          memberEntries.sort((a, b) {
            Timestamp timestampA = a.value['joinTimestamp'];
            Timestamp timestampB = b.value['joinTimestamp'];
            return timestampA.compareTo(timestampB);
          });
          List<double> latitudes = [];
          List<double> longitudes = [];

          for (var entry in memberEntries) {
            double longitude = entry.value['longitude'];
            double latitude = entry.value['latitude'];

            latitudes.add(latitude);
            longitudes.add(longitude);

            location.onLocationChanged.listen((LocationData currentLocation) {
              setState(() {
                userLocation = LatLng(
                    latitudes[widget.userIndex], longitudes[widget.userIndex]);
              });
            });
          }
        }

        return GoogleMap(
          myLocationEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
            mapController!.animateCamera(CameraUpdate.newLatLng(userLocation));
          },
          initialCameraPosition: CameraPosition(
            target: userLocation,
            zoom: 14.0,
          ),
        );
      },
    );
  }
}
