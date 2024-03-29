import 'package:weather_wizard/features/weather/domain/entities/weather_forecast.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_now.dart';

sealed class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherUpdated extends WeatherState {
  final WeatherNowEntity weatherNow;
  final List<DailyForecastEntity> dailyForecast;
  final List<HourlyForecastEntity> hourlyForecast;
  final String message;

  WeatherUpdated(
      {required this.weatherNow,
      required this.dailyForecast,
      required this.hourlyForecast,
      required this.message});
}

class WeatherFailure extends WeatherState {}