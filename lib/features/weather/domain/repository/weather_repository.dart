import 'package:weather_wizard/features/weather/data/models/weather_now.dart';

abstract interface class WeatherRepository {
  Future<WeatherNow> getWeather(
      {required double latitude, required double longitude});
}
