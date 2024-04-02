import 'dart:convert';

import 'package:weather_wizard/config/constants.dart';
import 'package:http/http.dart' as http;
import 'package:weather_wizard/core/common/temperature.dart';
import 'package:weather_wizard/features/weather/data/models/weather.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_forecast_period.dart';
import 'package:weather_wizard/features/weather/domain/repository/weather_repository.dart';

/// Exception thrown when getWeather fails.
class WeatherRequestFailure implements Exception {}

/// Exception thrown when weather for provided location is not found.
class WeatherNotFoundFailure implements Exception {}

class LocationNotFoundFailure implements Exception {}

class WeatherRepositoryImpl implements WeatherRepository {
  @override
  Future<WeatherEntity> getWeather(
      {required double latitude,
      required double longitude,
      DailyForecastPeriod dailyForecast = DailyForecastPeriod.ten,
      HourlyForecastPeriod hourlyForecast = HourlyForecastPeriod.twentyfour,
      TemperatureUnit units = TemperatureUnit.fahrenheit}) async {
    final String currentParams = [
      'temperature_2m',
      'relative_humidity_2m',
      'apparent_temperature',
      'is_day',
      'weather_code',
      'precipitation_probability'
    ].join(',');

    final String hourlyParams = [
      'temperature_2m',
      'relative_humidity_2m',
      'precipitation_probability',
      'weather_code'
    ].join(',');

    final String dailyParams = [
      'weather_code',
      'temperature_2m_max',
      'temperature_2m_min',
      'precipitation_probability_max'
    ].join(',');

    final weatherRequest = Uri.https(baseUrlWeather, 'v1/forecast', {
      'latitude': '$latitude',
      'longitude': '$longitude',
      'forecast_hours': '${hourlyForecast.hours}',
      'forecast_days': '${dailyForecast.days}',
      'temperature_unit': units.name,
      'current': currentParams,
      'hourly': hourlyParams,
      'daily': dailyParams
    });

    final weatherResponse = await http.get(weatherRequest);

    if (weatherResponse.statusCode != 200) {
      throw WeatherRequestFailure();
    }

    final weatherJson =
        jsonDecode(weatherResponse.body) as Map<String, dynamic>;

    return WeatherModel.fromJson(weatherJson);
  }
}
