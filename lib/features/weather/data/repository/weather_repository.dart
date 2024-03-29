import 'dart:convert';

import 'package:weather_wizard/config/constants.dart';
import 'package:http/http.dart' as http;
import 'package:weather_wizard/core/common/geolocation.dart';
import 'package:weather_wizard/features/weather/data/models/weather.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather.dart';
import 'package:weather_wizard/features/weather/domain/repository/weather_repository.dart';

/// Exception thrown when getWeather fails.
class WeatherRequestFailure implements Exception {}

/// Exception thrown when weather for provided location is not found.
class WeatherNotFoundFailure implements Exception {}

class WeatherRepositoryImpl implements WeatherRepository {
  @override
  Future<Geolocation> findSomePlace({required String name}) async {
    final searchRequest =
        Uri.https(baseUrlWeather, 'v1/search', {'name': name, 'count': '1'});

    final hopefullySomePlaceData = await http.get(searchRequest);

    if (hopefullySomePlaceData.statusCode != 200) {
      throw WeatherRequestFailure();
    }

    final geoJson =
        jsonDecode(hopefullySomePlaceData.body) as Map<String, dynamic>;

    return Geolocation.fromJson(geoJson);
  }

  @override
  Future<WeatherEntity> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    final weatherRequest = Uri.https(baseUrlWeather, 'v1/forecast', {
      'latitude': '$latitude',
      'longitude': '$longitude',
      'current': [
        'temperature_2m',
        'relative_humidity_2m',
        'apparent_temperature',
        'is_day',
        'weather_code',
        'precipitation_probability'
      ],
      'hourly': [
        'temperature_2m',
        'relative_humidity_2m',
        'precipitation_probability',
        'weather_code'
      ],
      'daily': [
        'weather_code',
        'temperature_2m_max',
        'temperature_2m_min',
        'precipitation_probability_max'
      ],
      'forecast_hours': '24',
      'forecast_days': '4'
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