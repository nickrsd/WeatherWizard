import 'package:quiver/iterables.dart';
import 'package:weather_wizard/features/weather/data/models/weather_forecast.dart';
import 'package:weather_wizard/features/weather/data/models/weather_now.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel(
      {super.weatherNow,
      super.dailyForecast = const [],
      super.hourlyForecast = const []});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final {
      'current': Map<String, dynamic> currentWeatherJson,
      'daily': Map<String, dynamic> dailyJson,
      'hourly': Map<String, dynamic> hourlyJson
    } = json;

    final {
      'time': List<dynamic> dailyTimestamps,
      'weather_code': List<dynamic> dailyCodes,
      'temperature_2m_max': List<dynamic> dailyMaxTemps,
      'temperature_2m_min': List<dynamic> dailyMinTemps,
    } = dailyJson;

    final {
      'time': List<dynamic> hourlyTimestamps,
      'weather_code': List<dynamic> hourlyCodes,
      'temperature_2m': List<dynamic> hourlyTemps,
    } = hourlyJson;

    const dailyKeys = [
      'time',
      'weather_code',
      'temperature_2m_max',
      'temperature_2m_min'
    ];
    const hourlyKeys = ['time', 'temperature_2m', 'weather_code'];

    final dailyForecastData = zip(
            [dailyTimestamps, dailyCodes, dailyMinTemps, dailyMaxTemps])
        .map((dailyValues) =>
            DailyForecast.fromJson(Map.fromIterables(dailyKeys, dailyValues)));

    final hourlyForecastData = zip([hourlyTimestamps, hourlyCodes, hourlyTemps])
        .map((hourlyValues) => HourlyForecast.fromJson(
            Map.fromIterables(hourlyKeys, hourlyValues)));

    return WeatherModel(
      weatherNow: WeatherNow.fromJson(currentWeatherJson),
      dailyForecast: dailyForecastData.toList(),
      hourlyForecast: hourlyForecastData.toList(),
    );
  }
}
