import 'package:bloc/bloc.dart';
import 'package:weather_wizard/features/weather/data/models/weather_condition.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_condition.dart';
import 'package:weather_wizard/features/weather/domain/repository/weather_repository.dart';
import 'package:weather_wizard/features/weather/presentation/bloc/weather_event.dart';
import 'package:weather_wizard/features/weather/presentation/bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository)
      : super(WeatherInitial(backgroundPath: "quiet_flame.gif")) {
    on<WeatherRequested>(onWeatherRequested);
  }

  void onWeatherRequested(
      WeatherRequested event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading(backgroundPath: "weather_portal.gif"));
    final weatherData = await _weatherRepository.getWeather(
        latitude: event.place.location.latitude.toDouble(),
        longitude: event.place.location.longitude.toDouble());

    if (weatherData
        case WeatherEntity(
          weatherNow: var now?,
          dailyForecast: var daily,
          hourlyForecast: var hourly
        )) {
      emit(WeatherUpdated(
          weather: weatherData,
          weatherNow: now,
          dailyForecast: daily,
          hourlyForecast: hourly,
          place: event.place,
          backgroundPath: WeatherConditionExtension.backgroundPath(
              now.condition ?? WeatherCondition.unknown,
              now.isDaytime ?? true)));
    }
  }
}
