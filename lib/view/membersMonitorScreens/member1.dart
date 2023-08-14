import 'dart:async';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kalanapp/utils/Map_Search.dart';
class Member1 extends StatefulWidget {
  const Member1({super.key});

  @override
  State<Member1> createState() => _Member1();
}

class _Member1 extends State<Member1> {
  List<LatLng> _routePoints = [];
  Location _location = Location();
  final Completer<GoogleMapController>_controller =
  Completer<GoogleMapController>();
  List<Polyline> _polylines = []; // Lista de polilíneas para dibujar en el mapa
  @override
  void initState() {
    super.initState();
    _startLocationUpdates();
  }

  void _startLocationUpdates() {
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      _getCurrentLocationAndAddToRoute();
    });
  }


  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,

  );


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              //zomControlsEneabled: activa y desativa el + y - de google maps
              zoomControlsEnabled: false,
              myLocationEnabled: true,
              polylines: Set<Polyline>.of(_polylines),
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: FloatingActionButton.extended(
                onPressed: _goToTheLake,
                label: const Text(''),
                icon: const Icon(Icons.gps_fixed),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: MyWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;

    LocationData locationData;

    try {
      locationData = await _location.getLocation();
    } catch (e) {
      print('Error de la ubiacion $e');
      return;
    }

    final LatLng currentLocation = LatLng(
      locationData.latitude!,
      locationData.longitude!,
    );
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: currentLocation,
        zoom: 15,
      ),
    ));
  }

  void _updateRouteOnMap() {
    final Polyline polyline = Polyline(
      polylineId: PolylineId('route'),
      color: Colors.blue, // Color personalizado para la línea de la ruta
      points: _routePoints,
    );

    setState(() {
      _polylines.add(polyline);
    });
  }

  //funcion para
  void _getCurrentLocationAndAddToRoute() async {
    LocationData locationData;

    try {
      locationData = await _location.getLocation();
    } catch (e) {
      print('Error de la ubicación $e');
      return;
    }

    final LatLng currentLocation = LatLng(
      locationData.latitude!,
      locationData.longitude!,
    );

    _routePoints.add(
        currentLocation);
    _updateRouteOnMap();
  }
}