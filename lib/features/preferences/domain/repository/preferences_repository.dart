import 'package:weather_wizard/features/preferences/domain/entity/preference.dart';

abstract interface class PreferencesRepository {
  Future<UserPreferenceEntity> loadPreferences();
  Future<UserPreferenceEntity> savePreferences(
      {required UserPreferenceEntity preferences});
}
