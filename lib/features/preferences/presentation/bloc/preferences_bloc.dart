import 'package:bloc/bloc.dart';
import 'package:weather_wizard/core/common/geolocation.dart';
import 'package:weather_wizard/core/common/temperature.dart';
import 'package:weather_wizard/features/preferences/domain/entity/preference.dart';
import 'package:weather_wizard/features/preferences/domain/repository/preferences_repository.dart';
import 'package:weather_wizard/features/preferences/presentation/bloc/preferences_event.dart';
import 'package:weather_wizard/features/preferences/presentation/bloc/preferences_state.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_forecast_period.dart';

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  final PreferencesRepository _preferencesRepository;

  PreferencesBloc(this._preferencesRepository)
      : super(UpdatedPreferences(UserPreferenceEntity(
            preferredUnits: TemperatureUnit.fahrenheit,
            dailyForecastDays: DailyForecastPeriod.ten,
            hourlyForecastHours: HourlyForecastPeriod.twentyfour,
            geolocation: GeolocationRandom.somewhereInTheWorld()))) {
    on<PickTemperaturePreference>(onHandlePickedPreferredTemperature);
    on<PickHourlyForecastPeriod>(onHandlePreferredHourlyForecast);
    on<PickDailyForecastPeriod>(onHandlePreferredDailyForecast);
    on<LoadPreferences>(onHandleLoadPreferences);
  }

  void onHandleLoadPreferences(
      LoadPreferences event, Emitter<PreferencesState> emit) async {
    final UserPreferenceEntity preferences =
        await _preferencesRepository.loadPreferences();
    emit(UpdatedPreferences(preferences));
  }

  void onHandlePickedPreferredTemperature(
      PickTemperaturePreference event, Emitter<PreferencesState> emit) async {
    _preferencesRepository.storePreferredTempUnits(event.units);
    final updatedPreferences = await _preferencesRepository.loadPreferences();
    emit(UpdatedPreferences(updatedPreferences));
  }

  void onHandlePreferredHourlyForecast(
      PickHourlyForecastPeriod event, Emitter<PreferencesState> emit) async {
    _preferencesRepository.storePreferredForecastHours(event.period);
    final updatedPreferences = await _preferencesRepository.loadPreferences();
    emit(UpdatedPreferences(updatedPreferences));
  }

  void onHandlePreferredDailyForecast(
      PickDailyForecastPeriod event, Emitter<PreferencesState> emit) async {
    _preferencesRepository.storePreferredForecastDays(event.period);
    final updatedPreferences = await _preferencesRepository.loadPreferences();
    emit(UpdatedPreferences(updatedPreferences));
  }

  void onHandlePreferredLocationChoice(
      PickDefaultLocationShown event, Emitter<PreferencesState> emit) async {
    _preferencesRepository.storePreferredDefaultLocation(event.location);
    final updatedPreferences = await _preferencesRepository.loadPreferences();
    emit(UpdatedPreferences(updatedPreferences));
  }
}
