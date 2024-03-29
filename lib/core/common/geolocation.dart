/// geo location of a user, generally coming from a mobile user's [latitude] and [longitude] in the world as reported by their device's location.
class Geolocation {
  final num latitude;
  final num longitude;
  final String name;

  Geolocation(this.latitude, this.longitude, this.name);

  @override
  List<Object?> get props => [latitude, longitude, name];

  factory Geolocation.fromJson(Map<String, dynamic> json) {
    final {
      'latitude': num latitude,
      'longitude': num longitude,
      'name': String name
    } = json;

    return Geolocation(latitude, longitude, name);
  }
}
