import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_marker/marker_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http; // Importa el paquete http
import 'package:kalanapp/utils/following_to_button.dart';
import 'package:kalanapp/utils/set_status_button.dart';
import 'package:location/location.dart';

class Member1 extends StatefulWidget {
  const Member1({super.key});
  @override
  State<Member1> createState() => _Member1();
}

class _Member1 extends State<Member1> {
  String userProfileImage = '';
  Set<Marker> markers = {};
  Marker? _userMarker;
  BitmapDescriptor? userProfileIcon;

  List<LatLng> routePoints = [];
  Location location = Location();
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  List<Polyline> polylines = []; // Lista de polilíneas para dibujar en el mapa

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
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
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      _getCurrentLocationAndAddToRoute();
    });
  }

  void _loadPreviousRoutes(String userId) async {
    routePoints.clear(); // Limpiar rutas anteriores
    polylines.clear(); // Limpiar polilíneas anteriores
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Usuarios')
        .doc(userId)
        .collection('routes')
        .get();
    routePoints.clear(); // Limpiar rutas anteriores
    polylines.clear(); // Limpiar polilíneas anteriores

    snapshot.docs.forEach((doc) {
      final data = doc.data() as Map<String, dynamic>;
      final latitude = data['latitude'];
      final longitude = data['longitude'];
      final LatLng point = LatLng(latitude, longitude);
      routePoints.add(point);
    });

    _updateRouteOnMap();
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(19.13699303254463, -96.97727638015108),
    zoom: 16,
  );

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
                //zomControlsEneabled: activa y desativa el + y - de google maps
                zoomControlsEnabled: false,
                myLocationEnabled: false,
                polylines: Set<Polyline>.of(polylines),
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
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  FollowingButton(
                    index: 0,
                  ),
                  Spacer(),
                  StatusButton(userIndex: 0),
                  SizedBox(
                    height: 150,
                  ),
                ],
              )
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
      locationData = await location.getLocation();
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
      polylineId: const PolylineId('route'),
      color: Colors.blue, // Color personalizado para la línea de la ruta
      width: 5,
      points: routePoints,
    );

    setState(() {
      polylines.add(polyline);
    });
  }

  //funcion para
  void _getCurrentLocationAndAddToRoute() async {
    LocationData locationData;

    try {
      locationData = await location.getLocation();
    } catch (e) {
      print('Error de la ubicación $e');
      return;
    }

    final LatLng currentLocation = LatLng(
      locationData.latitude!,
      locationData.longitude!,
    );
    routePoints.add(currentLocation);
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
          markerId: const MarkerId('userProfileMarker'),
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
