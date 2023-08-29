import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapKalan extends StatefulWidget {
  final int userIndex;
  const GoogleMapKalan({required this.userIndex, super.key});

  @override
  State<GoogleMapKalan> createState() => _GoogleMapKalanState();
}

class _GoogleMapKalanState extends State<GoogleMapKalan> {
  Location location = Location();
  late LatLng userLocation = const LatLng(0, 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      initialCameraPosition: CameraPosition(target: userLocation, zoom: 15),
      onMapCreated: (controller) {},
    );
  }
}
