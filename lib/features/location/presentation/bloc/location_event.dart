sealed class LocationEvent {
  const LocationEvent();
}

class SearchedLocation extends LocationEvent {
  final String place;

  SearchedLocation({required this.place});
}

class RequestedLocation extends LocationEvent {}
