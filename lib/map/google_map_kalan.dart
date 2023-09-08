import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapKalan extends StatefulWidget {
  final int userIndex;
  const GoogleMapKalan({required this.userIndex, super.key});

  @override
  State<GoogleMapKalan> createState() => _GoogleMapKalanState();
}

class _GoogleMapKalanState extends State<GoogleMapKalan> {
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
