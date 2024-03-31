import 'package:weather_wizard/core/common/geolocation.dart';
import 'package:weather_wizard/core/common/temperature.dart';
import 'package:weather_wizard/features/preferences/domain/entity/preference.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_forecast_period.dart';

abstract interface class PreferencesRepository {
  Future<UserPreferenceEntity> loadPreferences();
  Future<bool> storePreference<T>(String key, T value);
  Future<bool> storePreferredForecastDays(DailyForecastPeriod period);
  Future<bool> storePreferredForecastHours(HourlyForecastPeriod period);
  Future<bool> storePreferredTempUnits(TemperatureUnit units);
  Future<bool> storePreferredDefaultLocation(Geolocation location);
}
