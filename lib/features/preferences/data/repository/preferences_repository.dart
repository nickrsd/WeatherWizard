import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_wizard/core/common/geolocation.dart';
import 'package:weather_wizard/core/common/temperature.dart';
import 'package:weather_wizard/features/preferences/domain/entity/preference.dart';
import 'package:weather_wizard/features/preferences/domain/repository/preferences_repository.dart';
import 'package:weather_wizard/features/weather/data/models/weather_forecast.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_forecast_period.dart';

class _DefaultPreferences {
  final TemperatureUnit preferredUnits = TemperatureUnit.fahrenheit;
  final DailyForecastPeriod dailyForecastDays = DailyForecastPeriod.ten;
  final HourlyForecastPeriod hourlyForecastHours =
      HourlyForecastPeriod.twentyfour;
  final Geolocation geolocation = GeolocationRandom.somewhereInTheWorld();
}

class PreferencesRepositoryImpl implements PreferencesRepository {
  PreferencesRepositoryImpl();

  @override
  Future<UserPreferenceEntity> loadPreferences() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    final defaultPreferences = _DefaultPreferences();

    final String preferredUnits = storage.getString('preferredUnits') ?? "";
    final int dailyForecastDays = storage.getInt('dailyForecastDays') ??
        defaultPreferences.dailyForecastDays.days;
    final int hourlyForecastHours = storage.getInt('hourlyForecastHours') ??
        defaultPreferences.hourlyForecastHours.hours;
    final num latitude = storage.getDouble('latitude') ??
        defaultPreferences.geolocation.latitude;
    final num longitude = storage.getDouble('longitude') ??
        defaultPreferences.geolocation.longitude;

    final geolocation = Geolocation(
        latitude: latitude, longitude: longitude, name: "Somewhere");

    return UserPreferenceEntity(
        preferredUnits: TemperatureUnitExtension.fromString(preferredUnits) ??
            defaultPreferences.preferredUnits,
        dailyForecastDays:
            DailyForecastPeriodValues.fromCode(dailyForecastDays),
        hourlyForecastHours:
            HourlyForecastPeriodValues.fromCode(hourlyForecastHours),
        geolocation: geolocation);
  }

  @override
  Future<bool> storePreference<T>(String key, T value) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    if (value is int) {
      return storage.setInt(key, value);
    }
    if (value is String) {
      return storage.setString(key, value);
    }
    if (value is double) {
      return storage.setDouble(key, value);
    }
    if (value is bool) {
      return storage.setBool(key, value);
    }
    if (value is num) {
      return storage.setDouble(key, value.toDouble());
    }
    return false;
  }

  @override
  Future<bool> storePreferredForecastDays(DailyForecastPeriod period) async {
    return await storePreference('dailyForecastDays', period.days);
  }

  @override
  Future<bool> storePreferredForecastHours(HourlyForecastPeriod period) async {
    return await storePreference('hourlyForecastHours', period.hours);
  }

  @override
  Future<bool> storePreferredTempUnits(TemperatureUnit units) async {
    return await storePreference('temperatureUnits', units.name);
  }

  @override
  Future<bool> storePreferredDefaultLocation(Geolocation location) async {
    final storedLatitude = await storePreference('latitude', location.latitude);
    final storedLongitude =
        await storePreference('latitude', location.longitude);
    return storedLatitude && storedLongitude;
  }
}
