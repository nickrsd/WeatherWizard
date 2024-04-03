import 'package:equatable/equatable.dart';
import 'package:weather_wizard/core/common/geolocation.dart';

class PlaceDescriptorParsingError extends Error {}

class PlaceDescriptor extends Equatable {
  final String name;
  final String feature;
  final String description;
  final Geolocation location;

  const PlaceDescriptor(
      {required this.name,
      required this.feature,
      required this.description,
      required this.location});

  @override
  List<Object?> get props => [name, feature, description, location];

  factory PlaceDescriptor.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          "name": String name,
          "notableFeature": String notableFeature,
          "description": String description,
          "location": dynamic location
        } when location is Map<String, dynamic>) {
      return PlaceDescriptor(
          name: name,
          feature: notableFeature,
          description: description,
          location: Geolocation.fromJson(location));
    } else {
      throw PlaceDescriptorParsingError as Error;
    }
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        "name": name,
        "feature": feature,
        "description": description,
        "location": location.toJson()
      };
}
