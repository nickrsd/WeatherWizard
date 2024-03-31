import 'package:weather_wizard/features/preferences/domain/entity/preference.dart';

sealed class PreferencesState {
  final UserPreferenceEntity preferences;

  PreferencesState(this.preferences);
}

class PreferencesInitial extends PreferencesState {
  PreferencesInitial(super.preferences);
}

class UpdatedPreferences extends PreferencesState {
  UpdatedPreferences(super.preferences);
}
