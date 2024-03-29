import 'package:equatable/equatable.dart';

import 'package:weather_wizard/features/weather/domain/entities/weather_condition.dart';

/// Weather for a single day from a 1-16 day forecast.
///
/// Compact weather for the iso8601 day of [time], its most prominent [condition], and the projected daily [minTemperature] low / [maxTemperature] high
class DailyForecastEntity extends Equatable {
  final num? maxTemperature;
  final num? minTemperature;
  final WeatherCondition? condition;
  final String? time;

  // TODO: need icon
  // expected hightemp, lowtemp, conditions (sunny/rainy), icon for each day
  const DailyForecastEntity(
      {this.maxTemperature, this.minTemperature, this.condition, this.time});

  @override
  List<Object?> get props => [maxTemperature, minTemperature, condition, time];
}

/// Weather snapshot of one hour from a 1-24hr forecast
///
/// iso8601 hour at [time] with most prominent weather [condition] and projected [temperature] in user's selected C/F units
class HourlyForecastEntity extends Equatable {
  final num? temperature;
  final WeatherCondition? condition;
  final String? time;

  // requires temperature, conditions (sunny/rainy), time, day/night
  const HourlyForecastEntity({
    this.temperature,
    this.condition,
    this.time,
  });

  @override
  List<Object?> get props => [
        temperature,
        condition,
        time,
      ];
}
