import 'package:weather_wizard/core/common/place.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_forecast.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_now.dart';

sealed class WeatherState {
  final String backgroundPath;

  WeatherState({required this.backgroundPath});
}

class WeatherInitial extends WeatherState {
  WeatherInitial({required super.backgroundPath});
}

class WeatherLoading extends WeatherState {
  WeatherLoading({required super.backgroundPath});
}

class WeatherUpdated extends WeatherState {
  final WeatherEntity weather;
  final WeatherNowEntity weatherNow;
  final List<DailyForecastEntity> dailyForecast;
  final List<HourlyForecastEntity> hourlyForecast;
  final PlaceDescriptor place;

  WeatherUpdated(
      {required this.weather,
      required this.weatherNow,
      required this.dailyForecast,
      required this.hourlyForecast,
      required this.place,
      required super.backgroundPath});
}
