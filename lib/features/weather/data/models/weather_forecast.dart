import 'package:weather_wizard/features/weather/data/models/weather_condition.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_forecast.dart';

class DailyForecast extends DailyForecastEntity {
  // expected hightemp, lowtemp, conditions (sunny/rainy), icon for each day
  const DailyForecast(
      {super.maxTemperature,
      super.minTemperature,
      super.condition,
      super.time});

  @override
  List<Object?> get props => [maxTemperature, minTemperature, condition, time];

  factory DailyForecast.fromJson(Map<String, dynamic> json) {
    final {
      'temperature_2m_min': num minTemp,
      'temperature_2m_max': num maxTemp,
      'weather_code': num weatherCode,
      'time': String timestamp,
    } = json;

    return DailyForecast(
        maxTemperature: maxTemp,
        minTemperature: minTemp,
        condition: WeatherConditionExtension.fromCode(weatherCode),
        time: timestamp);
  }
}

/// Weather snapshot of one hour from a 1-24hr forecast
///
/// iso8601 hour at [time] with most prominent weather [condition] and projected [temperature] in user's selected C/F units
class HourlyForecast extends HourlyForecastEntity {
  // requires temperature, conditions (sunny/rainy), time, day/night
  const HourlyForecast({
    super.temperature,
    super.condition,
    super.time,
  });

  @override
  List<Object?> get props => [
        temperature,
        condition,
        time,
      ];

  factory HourlyForecast.fromJson(Map<String, dynamic> json) {
    final {
      'temperature_2m': num temp,
      'weather_code': num weatherCode,
      'time': String timestamp,
    } = json;

    return HourlyForecast(
        temperature: temp,
        condition: WeatherConditionExtension.fromCode(weatherCode),
        time: timestamp);
  }
}
