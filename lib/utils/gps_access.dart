import 'package:geolocator/geolocator.dart';

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Los servicios de ubicación están desabilitados');
  }

  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Los servicios de ubicación no esán permitidos');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Los permisos de ubicación está desabilitados permanentemente');
  }

  return await Geolocator.getCurrentPosition();
}
