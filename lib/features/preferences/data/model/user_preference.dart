import 'package:weather_wizard/features/preferences/domain/entity/preference.dart';

class UserPreference extends UserPreferenceEntity {
  const UserPreference(
      {required super.preferredUnits,
      required super.dailyForecastDays,
      required super.hourlyForecastHours,
      required super.geolocation});
}
