import 'package:equatable/equatable.dart';
import 'package:weather_wizard/core/common/geolocation.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_forecast_period.dart';

class UserPreferenceEntity extends Equatable {
  final bool? preferFahrenheight;
  final DailyForecastPeriod? dailyForecastDays;
  final HourlyForecastPeriod? hourlyForecastHours;
  final Geolocation? geolocation;

  const UserPreferenceEntity(
      {this.preferFahrenheight,
      this.dailyForecastDays,
      this.hourlyForecastHours,
      this.geolocation});

  @override
  List<Object?> get props =>
      [preferFahrenheight, dailyForecastDays, hourlyForecastHours];
}
