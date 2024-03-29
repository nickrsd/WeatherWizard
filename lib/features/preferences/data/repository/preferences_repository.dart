import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_wizard/core/common/geolocation.dart';
import 'package:weather_wizard/features/preferences/domain/entity/preference.dart';
import 'package:weather_wizard/features/preferences/domain/repository/preferences_repository.dart';
import 'package:weather_wizard/features/weather/data/models/weather_forecast.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_forecast_period.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  PreferencesRepositoryImpl();

  @override
  Future<UserPreferenceEntity> loadPreferences() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    final bool? preferFahrenheight = storage.getBool('preferFahrenheight');
    final int? dailyForecastDays = storage.getInt('dailyForecastDays');
    final int? hourlyForecastHours = storage.getInt('hourlyForecastHours');
    final num? latitude = storage.getDouble('latitude');
    final num? longitude = storage.getDouble('longitude');

    final Geolocation geolocation = latitude != null && longitude != null
        ? Geolocation(
            latitude: latitude, longitude: longitude, name: "Somewhere")
        : GeolocationRandom.somewhereInTheWorld();

    final forecastDays = dailyForecastDays != null
        ? DailyForecastPeriodValues.fromCode(dailyForecastDays)
        : DailyForecastPeriod.fourteen;
    final forecastHours = hourlyForecastHours != null
        ? HourlyForecastPeriodValues.fromCode(hourlyForecastHours)
        : HourlyForecastPeriod.twelve;

    return UserPreferenceEntity(
        preferFahrenheight: preferFahrenheight,
        dailyForecastDays: forecastDays,
        hourlyForecastHours: forecastHours,
        geolocation: geolocation);
  }

  @override
  Future<UserPreferenceEntity> savePreferences(
      {required UserPreferenceEntity preferences}) async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    var UserPreferenceEntity(
      :preferFahrenheight,
      :dailyForecastDays,
      :hourlyForecastHours,
      :geolocation
    ) = preferences;

    if (dailyForecastDays != null) {
      storage.setInt('dailyForecastDays', dailyForecastDays.toInt());
    }
    if (hourlyForecastHours != null) {
      storage.setInt('hourlyForecastHours', hourlyForecastHours.toInt());
    }
    if (preferFahrenheight != null) {
      storage.setBool('preferFahrenheight', preferFahrenheight);
    }
    if (geolocation != null) {
      storage.setDouble('latitude', geolocation.latitude.toDouble());
      storage.setDouble('longitude', geolocation.longitude.toDouble());
    }

    return await loadPreferences();
  }
}
