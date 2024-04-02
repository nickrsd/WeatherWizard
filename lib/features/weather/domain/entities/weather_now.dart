import 'package:equatable/equatable.dart';

import 'package:weather_wizard/features/weather/domain/entities/weather_condition.dart';

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
  final num? apparentTemperature;

  const WeatherNowEntity(
      {this.temperature,
      this.apparentTemperature,
      this.relativeHumidity,
      this.condition,
      this.isDaytime,
      this.precipitationChance,
      this.time});

  @override
  List<Object?> get props => [
        temperature,
        apparentTemperature,
        relativeHumidity,
        condition,
        isDaytime,
        precipitationChance,
        time
      ];
}
