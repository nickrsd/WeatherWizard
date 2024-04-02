import 'package:equatable/equatable.dart';
import 'package:weather_wizard/core/common/geolocation.dart';
import 'package:weather_wizard/core/common/temperature.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_forecast_period.dart';

class UserPreferenceEntity extends Equatable {
  final TemperatureUnit preferredUnits;
  final DailyForecastPeriod dailyForecastDays;
  final HourlyForecastPeriod hourlyForecastHours;
  final Geolocation geolocation;

  const UserPreferenceEntity(
      {required this.preferredUnits,
      required this.dailyForecastDays,
      required this.hourlyForecastHours,
      required this.geolocation});

  @override
  List<Object?> get props =>
      [preferredUnits, dailyForecastDays, hourlyForecastHours, geolocation];
}
