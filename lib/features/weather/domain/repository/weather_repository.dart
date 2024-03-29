import 'package:weather_wizard/core/common/geolocation.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather.dart';

abstract interface class WeatherRepository {
  Future<WeatherEntity> getWeather(
      {required double latitude, required double longitude});

  Future<Geolocation> findSomePlace({required String name});
}
