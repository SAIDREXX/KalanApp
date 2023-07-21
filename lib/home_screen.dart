  import 'dart:async';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  Location _location = Location();
  final Completer<GoogleMapController>_controller =
      Completer<GoogleMapController>();


  static const CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,

  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar : AppBar(
            //Barra de la App
             title: Text('Bienvenido A Kalan') ,
    ),
            //Se llama cajon de navegacion
          drawer: const NavigationDrawer(),

      body: GoogleMap(
        //zomControlsEneabled: activa y desativa el + y - de google maps
        zoomControlsEnabled: false,
        myLocationEnabled:true,
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: Column(

        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text(''),
        icon: const Icon(Icons.gps_fixed),
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
   }catch(e){
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
}
//COdigo de Cajon  de navegacion
class NavigationDrawer extends StatelessWidget{
  const NavigationDrawer({Key? key}): super(key:key);

//TODO: Terminar las opciones de cajon de navegacion.
  @override
  Widget build (BuildContext context) => Drawer();
}