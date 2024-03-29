import 'package:weather_wizard/core/common/temperature.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_forecast_period.dart';

class PreferencesState {
  PreferencesState();
}

class UpdatedPreferences extends PreferencesState {
  final TemperatureUnit tempPreference;
  final DailyForecastPeriod dailyForecast;
  final HourlyForecastPeriod hourlyForecast;

  UpdatedPreferences(
      {required this.tempPreference,
      required this.dailyForecast,
      required this.hourlyForecast});
}
