import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kalanapp/constants.dart';
import 'package:kalanapp/constants/colors.dart';
import 'package:kalanapp/utils/following_to_button.dart';
import 'package:kalanapp/utils/set_status_button.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Member4 extends StatefulWidget {
  const Member4({super.key});

  @override
  State<Member4> createState() => _Member4State();
}

class _Member4State extends State<Member4> {
  final Completer<GoogleMapController> controller = Completer();
  late String groupName;
  //Lista que guarda las rutas
  List<LatLng> polylinesCoordinates = [];
  LocationData? currentLocation;
  late User? user;
  late Map<String, dynamic> membersInfo;
  PolylinePoints polylinePoints = PolylinePoints();
  BitmapDescriptor currentLocationImage = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    getCurrentLocation();
    user = FirebaseAuth.instance.currentUser;
    fetchUserPicture();
    super.initState();
  }

  void fetchUserPicture() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    groupName = prefs.getString('groupName') ?? user!.uid.substring(0, 6);
    Future<DocumentSnapshot> groupData =
        FirebaseFirestore.instance.collection('groups').doc(groupName).get();
    DocumentSnapshot snapshot = await groupData;

    if (snapshot.exists) {
      membersInfo = snapshot['membersInfo'];

      List<MapEntry<String, dynamic>> memberEntries =
          membersInfo.entries.toList();

      memberEntries.sort((a, b) {
        Timestamp timestampA = a.value['joinTimestamp'];
        Timestamp timestampB = b.value['joinTimestamp'];
        return timestampA.compareTo(timestampB);
      });
      List<String> userProfilePicture = [];

      memberEntries.forEach((entry) {
        String profilePictureURL = entry.value['pictureURL'];
        userProfilePicture.add(profilePictureURL);
      });

      final pictureRequest = await http.get(Uri.parse(userProfilePicture[3]));
      final pictureBytes = pictureRequest.bodyBytes;
      setState(() {
        currentLocationImage = BitmapDescriptor.fromBytes(pictureBytes);
      });
    }
  }

  void getCurrentLocation() async {
    Location location = Location();

    location.onLocationChanged.listen((newLocation) async {
      if (currentLocation == null) {
        final GoogleMapController googleMapController = await controller.future;
        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(CameraPosition(
              target: LatLng(newLocation.latitude!, newLocation.longitude!),
              zoom: 16)),
        );
      }
      setState(() {
        currentLocation = newLocation;
        polylinesCoordinates.add(
            LatLng(currentLocation!.latitude!, currentLocation!.longitude!));

        if (polylinesCoordinates.length >= 2) {
          Future<PolylineResult> result =
              polylinePoints.getRouteBetweenCoordinates(
                  google_api_key,
                  PointLatLng(
                      polylinesCoordinates[polylinesCoordinates.length - 2]
                          .latitude,
                      polylinesCoordinates[polylinesCoordinates.length - 2]
                          .longitude),
                  PointLatLng(newLocation.latitude!, newLocation.longitude!));

          result.then((value) {
            if (value.points.isNotEmpty) {
              value.points.forEach((point) {
                polylinesCoordinates
                    .add(LatLng(point.latitude, point.longitude));
              });
            }
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: height,
        width: double.infinity,
        child: SizedBox(
          width: 500,
          height: 500,
          child: Stack(
            alignment: Alignment.center,
            children: [
              GoogleMap(
                initialCameraPosition:
                    const CameraPosition(target: LatLng(0, 0), zoom: 10),
                polylines: {
                  Polyline(
                    polylineId: const PolylineId("route"),
                    points: polylinesCoordinates,
                    color: ColorConstants.jazPalette3,
                    width: 6,
                  ),
                },
                markers: {
                  Marker(
                      icon: currentLocationImage,
                      markerId: const MarkerId("currentLocation"),
                      position: LatLng(currentLocation?.latitude ?? 0,
                          currentLocation?.longitude ?? 0)),
                },
                onMapCreated: (mapController) {
                  controller.complete(mapController);
                },
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  FollowingButton(
                    index: 3,
                  ),
                  Spacer(),
                  StatusButton(userIndex: 3),
                  SizedBox(
                    height: 150,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
