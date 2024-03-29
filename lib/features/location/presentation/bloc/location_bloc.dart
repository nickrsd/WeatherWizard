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
