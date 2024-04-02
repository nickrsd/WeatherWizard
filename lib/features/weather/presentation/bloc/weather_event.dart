import 'package:weather_wizard/core/common/place.dart';
import 'package:weather_wizard/core/common/temperature.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_forecast_period.dart';

sealed class WeatherEvent {}

class WeatherRequested extends WeatherEvent {
  final PlaceDescriptor place;
  final DailyForecastPeriod dailyForecast;
  final HourlyForecastPeriod hourlyForecast;
  final TemperatureUnit temperatureUnit;

  WeatherRequested(
      {required this.place,
      required this.dailyForecast,
      required this.hourlyForecast,
      required this.temperatureUnit});
}
