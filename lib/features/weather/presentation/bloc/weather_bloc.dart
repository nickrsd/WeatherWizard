import 'package:bloc/bloc.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather.dart';
import 'package:weather_wizard/features/weather/domain/repository/weather_repository.dart';
import 'package:weather_wizard/features/weather/presentation/bloc/weather_event.dart';
import 'package:weather_wizard/features/weather/presentation/bloc/weather_state.dart';

/// across what period does this weather report data for, just right now (currentWeather), across multiple days, or an hourly forecast.
enum WeatherForecastPeriod {
  currentWeather,
  dailyForecast,
  hourlyForecast,
}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(WeatherInitial()) {
    on<WeatherRequested>(onWeatherRequested);
  }

  void onWeatherRequested(
      WeatherRequested event, Emitter<WeatherState> emit) async {
    final weatherData = await _weatherRepository.getWeather(
        latitude: event.location.latitude.toDouble(),
        longitude: event.location.longitude.toDouble());

    if (weatherData
        case WeatherEntity(
          weatherNow: var now?,
          dailyForecast: var daily,
          hourlyForecast: var hourly
        )) {
      emit(WeatherUpdated(
          weatherNow: now,
          dailyForecast: daily,
          hourlyForecast: hourly,
          message: "test"));
    }
  }
}
