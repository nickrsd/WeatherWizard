import 'package:geolocator/geolocator.dart';
import 'package:weather_wizard/core/common/geolocation.dart';

abstract interface class LocationRepository {
  Future<Position> determinePosition();

  Future<Geolocation> findSomePlace({required String name});
}
