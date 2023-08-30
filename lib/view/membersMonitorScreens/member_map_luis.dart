import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_marker/marker_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http; // Importa el paquete http
import 'package:kalanapp/utils/Map_Search.dart';
import 'package:location/location.dart';

class MemberMapLuis extends StatefulWidget {
  const MemberMapLuis({super.key});
  @override
  State<MemberMapLuis> createState() => _Member1();
}

class _Member1 extends State<MemberMapLuis> {
  String userProfileImage = '';
  Set<Marker> markers = {};
  Marker? _userMarker;
  BitmapDescriptor? userProfileIcon;

  List<LatLng> _routePoints = [];
  Location _location = Location();
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  List<Polyline> _polylines = []; // Lista de polilíneas para dibujar en el mapa
  @override
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      _startLocationUpdates();
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        _loadPreviousRoutes(user.uid); // Llamada a cargar rutas anteriores
        loadUserProfileIcon();
      }
    });
  }

  /// metodos de cargar imagenes

  Future<void> loadUserProfileIcon() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final String? profileImageUrl = user.photoURL;
      if (profileImageUrl != null) {
        // Obtener los bytes de la imagen a partir de la URL
        final imageBytes = await getBytesFromUrl(profileImageUrl);

        // Crear un BitmapDescriptor a partir de los bytes de la imagen
        userProfileIcon = BitmapDescriptor.fromBytes(imageBytes);

        setState(() {
          userProfileImage = profileImageUrl;
        });
      } else {
        // Maneja el caso en el que la propiedad photoURL sea nula
      }
    } else {
      // Maneja el caso en el que el usuario no haya iniciado sesión
    }
  }

  Future<Uint8List> getBytesFromUrl(String url) async {
    final response = await http.get(Uri.parse(url));
    return response.bodyBytes;
  }

  void _startLocationUpdates() {
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      _getCurrentLocationAndAddToRoute();
    });
  }

  void _loadPreviousRoutes(String userId) async {
    _routePoints.clear(); // Limpiar rutas anteriores
    _polylines.clear(); // Limpiar polilíneas anteriores
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Usuarios')
        .doc(userId)
        .collection('routes')
        .get();
    _routePoints.clear(); // Limpiar rutas anteriores
    _polylines.clear(); // Limpiar polilíneas anteriores

    snapshot.docs.forEach((doc) {
      final data = doc.data() as Map<String, dynamic>;
      final latitude = data['latitude'];
      final longitude = data['longitude'];
      final LatLng point = LatLng(latitude, longitude);
      _routePoints.add(point);
    });

    _updateRouteOnMap();
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: SizedBox(
          width: 500,
          height: 800,
          child: Stack(
            alignment: Alignment.center,
            children: [
              GoogleMap(
                //zomControlsEneabled: activa y desativa el + y - de google maps
                zoomControlsEnabled: false,
                myLocationEnabled: false,
                polylines: Set<Polyline>.of(_polylines),
                myLocationButtonEnabled: false,
                mapType: MapType.normal,

                markers: {
                  if (_userMarker != null) _userMarker!,
                },
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
      width: 5,
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
    _routePoints.add(currentLocation);
    _updateRouteOnMap();

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('Usuarios')
          .doc(user.uid)
          .collection('routes')
          .add({
        'latitude': currentLocation.latitude,
        'longitude': currentLocation.longitude,
        'timestamp': FieldValue.serverTimestamp(),
      });

      setState(() async {
        _userMarker = Marker(
          markerId: MarkerId('userProfileMarker'),
          position: currentLocation,
          //borde del incono
          icon: await MarkerIcon.downloadResizePictureCircle(userProfileImage,
              size: 150,
              addBorder: true,
              borderColor: Colors.white,
              borderSize: 15),
        );
      });
    }
  }
}
