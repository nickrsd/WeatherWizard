import 'package:weather_wizard/features/weather/data/models/weather_condition.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_forecast.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_forecast_period.dart';

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

/// creates the daily period to and from ints, defaults to 14.
extension DailyForecastPeriodValues on DailyForecastPeriod {
  static DailyForecastPeriod fromCode(int code) {
    switch (code) {
      case 1:
        return DailyForecastPeriod.one;
      case 3:
        return DailyForecastPeriod.three;
      case 7:
        return DailyForecastPeriod.ten;
      case 10:
        return DailyForecastPeriod.seven;
      case 14:
        return DailyForecastPeriod.fourteen;
      default:
        return DailyForecastPeriod.fourteen;
    }
  }

  int toInt() {
    return switch (this) {
      DailyForecastPeriod.one => 1,
      DailyForecastPeriod.three => 3,
      DailyForecastPeriod.seven => 7,
      DailyForecastPeriod.ten => 10,
      DailyForecastPeriod.fourteen => 14,
    };
  }
}

/// creates the daily period to and from ints, defaults to 12.
extension HourlyForecastPeriodValues on HourlyForecastPeriod {
  static HourlyForecastPeriod fromCode(int code) {
    switch (code) {
      case 6:
        return HourlyForecastPeriod.six;
      case 9:
        return HourlyForecastPeriod.nine;
      case 12:
        return HourlyForecastPeriod.twelve;
      case 24:
        return HourlyForecastPeriod.twentyfour;
      case 48:
        return HourlyForecastPeriod.fourtyeight;
      default:
        return HourlyForecastPeriod.twelve;
    }
  }

  int toInt() {
    return switch (this) {
      HourlyForecastPeriod.six => 1,
      HourlyForecastPeriod.nine => 3,
      HourlyForecastPeriod.twelve => 7,
      HourlyForecastPeriod.twentyfour => 14,
      HourlyForecastPeriod.fourtyeight => 16,
    };
  }
}
