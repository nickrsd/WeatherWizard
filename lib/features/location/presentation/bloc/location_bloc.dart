import 'package:bloc/bloc.dart';
import 'package:weather_wizard/core/common/geolocation.dart';
import 'package:weather_wizard/core/common/nonsense.dart';
import 'package:weather_wizard/features/location/data/repository/location_repository.dart';
import 'package:weather_wizard/features/location/domain/repository/location_repository.dart';
import 'package:weather_wizard/features/location/presentation/bloc/location_event.dart';
import 'package:weather_wizard/features/location/presentation/bloc/location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationRepository _locationRepository;

  LocationBloc(this._locationRepository) : super(LocationInitial()) {
    on<SearchedLocation>(onSearchedLocation);
    on<RequestedLocation>(onRequestedLocation);
  }

  void onRequestedLocation(
      RequestedLocation event, Emitter<LocationState> emit) async {
    final location = await _locationRepository.determinePosition();
    emit(LocationUpdated(
        message: "location updated",
        placeDescription: "N/A",
        location: Geolocation(
            latitude: location.latitude,
            longitude: location.longitude,
            name: "${location.timestamp}")));
  }

  void onSearchedLocation(
      SearchedLocation event, Emitter<LocationState> emit) async {
    try {
      Geolocation location =
          await _locationRepository.findSomePlace(name: event.place);

      emit(LocationUpdated(
          location: location,
          placeDescription: "placeholder description",
          message: "placeholder message"));
    } on LocationNotFoundFailure catch (_) {
      emit(LocationSearchFailed(message: CringyMessage.nothingAt(event.place)));
    }
  }
}
