//import 'package:geolocator/geolocator.dart';
import 'package:weather_wizard/core/common/geolocation.dart';

class Position {
  final num latitude = 0.0;
  final num longitude = 0.0;
}

abstract interface class LocationRepository {
  Future<Position> determinePosition();

  Future<Geolocation> findSomePlace({required String name});
}
