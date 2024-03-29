import 'package:equatable/equatable.dart';

import 'weather_condition.dart';

/// The current weather data from most recent 15min aggregate.
///
/// most active [condition] paired with recent data. [temperature] units (F or C) are based on current user setting.
///  [relativeHumidity] & [precipitationChance] are percentages from 0-100 (not decimals)
/// see https://open-meteo.com/en/docs for detailed params
class WeatherNowEntity extends Equatable {
  final num? temperature;
  final num? relativeHumidity;
  final WeatherCondition? condition;
  final bool? isDaytime;
  final num? precipitationChance;
  final String? time;

  const WeatherNowEntity(
      {this.temperature,
      this.relativeHumidity,
      this.condition,
      this.isDaytime,
      this.precipitationChance,
      this.time});

  @override
  List<Object?> get props => [
        temperature,
        relativeHumidity,
        condition,
        isDaytime,
        precipitationChance,
        time
      ];
}
