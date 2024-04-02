import 'package:weather_wizard/core/common/temperature.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_forecast_period.dart';

abstract interface class WeatherRepository {
  Future<WeatherEntity> getWeather(
      {required double latitude,
      required double longitude,
      DailyForecastPeriod dailyForecast = DailyForecastPeriod.ten,
      HourlyForecastPeriod hourlyForecast = HourlyForecastPeriod.twentyfour,
      TemperatureUnit units = TemperatureUnit.fahrenheit});
}
