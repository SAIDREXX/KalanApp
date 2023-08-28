import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsMaps extends StatefulWidget {
  const GoogleMapsMaps({super.key});

  @override
  State<GoogleMapsMaps> createState() => _GoogleMapsMapsState();
}

class _GoogleMapsMapsState extends State<GoogleMapsMaps> {
  GoogleMapController? mapController;
  Location location = Location();
  List<LatLng> routePoints = [];

  @override
  void initState() {
    super.initState();
    location.onLocationChanged.listen((LocationData currentLocation) {
      if (mapController != null) {
        mapController!.animateCamera(CameraUpdate.newLatLng(
            LatLng(currentLocation.latitude!, currentLocation.longitude!)));

        setState(() {
          routePoints.add(
              LatLng(currentLocation.latitude!, currentLocation.longitude!));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      zoomControlsEnabled: false,
      compassEnabled: true,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      mapType: MapType.normal,
      initialCameraPosition: const CameraPosition(
          target: LatLng(19.137275040411904, -96.9761493805079), zoom: 15),
      onMapCreated: (GoogleMapController controller) {
        mapController = controller;
      },
      markers: Set.from(routePoints.map((point) =>
          Marker(markerId: MarkerId(point.toString()), position: point))),
      polylines: {
        Polyline(
          polylineId: const PolylineId('route'),
          visible: true,
          points: routePoints,
          color: Colors.blue,
          width: 4,
        )
      },
    );
  }
}
