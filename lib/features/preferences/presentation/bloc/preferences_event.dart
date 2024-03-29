import 'package:weather_wizard/core/common/temperature.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_forecast_period.dart';

class PreferencesEvent {
  PreferencesEvent();
}

class LoadPreferences extends PreferencesEvent {}

class PickTemperaturePreference extends PreferencesEvent {
  final TemperatureUnit units;

  PickTemperaturePreference({required this.units});
}

class PickDailyForecastPeriod extends PreferencesEvent {
  final DailyForecastPeriod period;

  PickDailyForecastPeriod({required this.period});
}

class PickHourlyForecastPeriod extends PreferencesEvent {
  final DailyForecastPeriod period;

  PickHourlyForecastPeriod({required this.period});
}
