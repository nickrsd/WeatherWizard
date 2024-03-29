import 'package:geolocator/geolocator.dart';

abstract interface class LocationRepository {
  Future<Position> determinePosition();
}
