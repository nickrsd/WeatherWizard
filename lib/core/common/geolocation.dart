import 'dart:math';

import 'package:equatable/equatable.dart';

/// geo location of a user, generally coming from a mobile user's [latitude] and [longitude] in the world as reported by their device's location.
class Geolocation extends Equatable {
  final num latitude;
  final num longitude;

  const Geolocation({required this.latitude, required this.longitude});

  @override
  List<Object?> get props => [latitude, longitude];

  factory Geolocation.fromJson(Map<String, dynamic> json) {
    final {'latitude': num latitude, 'longitude': num longitude} = json;

    return Geolocation(latitude: latitude, longitude: longitude);
  }
}

/// latitude is -90 to 90, longitude is -180 to 180, select random place in the world.
extension GeolocationRandom on Geolocation {
  static Geolocation somewhereInTheWorld() {
    final num latitude = Random().randomDouble(-90, 90);
    final num longitude = Random().randomDouble(-180, 180);
    return Geolocation(latitude: latitude, longitude: longitude);
  }
}

extension RX on Random {
  double randomDouble(double min, double max) {
    return (nextDouble() * (max - min) + min);
  }
}
