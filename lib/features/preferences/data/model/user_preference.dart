import 'package:weather_wizard/features/preferences/domain/entity/preference.dart';

class UserPreference extends UserPreferenceEntity {
  const UserPreference(
      {super.preferFahrenheight,
      super.dailyForecastDays,
      super.hourlyForecastHours,
      super.geolocation});
}
