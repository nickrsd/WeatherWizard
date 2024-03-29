import 'package:weather_wizard/core/common/geolocation.dart';

class LocationState {}

class LocationInitial extends LocationState {}

class LocationUnknown extends LocationState {
  final String message;

  LocationUnknown({required this.message});
}

class LocationSearchFailed extends LocationState {
  final String message;

  LocationSearchFailed({required this.message});
}

class LocationUpdated extends LocationState {
  final Geolocation location;
  final String message;
  final String placeDescription;

  LocationUpdated(
      {required this.location,
      required this.message,
      required this.placeDescription});
}
