import 'package:bloc/bloc.dart';
import 'package:weather_wizard/core/common/temperature.dart';
import 'package:weather_wizard/features/preferences/domain/entity/preference.dart';
import 'package:weather_wizard/features/preferences/domain/repository/preferences_repository.dart';
import 'package:weather_wizard/features/preferences/presentation/bloc/preferences_event.dart';
import 'package:weather_wizard/features/preferences/presentation/bloc/preferences_state.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_forecast_period.dart';

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  final PreferencesRepository _preferencesRepository;

  PreferencesBloc(this._preferencesRepository)
      : super(UpdatedPreferences(
            tempPreference: TemperatureUnit.fahrenheit,
            dailyForecast: DailyForecastPeriod.seven,
            hourlyForecast: HourlyForecastPeriod.twelve)) {
    on<PickTemperaturePreference>(onHandlePickedPreferredTemperature);
    on<PickHourlyForecastPeriod>(onHandleHourlyForecastRange);
    on<PickDailyForecastPeriod>(onHandleDailyForecastRange);
    on<LoadPreferences>(onHandleLoadPreferences);
  }

  void onHandleLoadPreferences(
      LoadPreferences event, Emitter<PreferencesState> emit) async {
    var UserPreferenceEntity(
      :preferFahrenheight,
      :dailyForecastDays,
      :hourlyForecastHours
    ) = await _preferencesRepository.loadPreferences();

    if (preferFahrenheight != null &&
        dailyForecastDays != null &&
        hourlyForecastHours != null) {
      emit(UpdatedPreferences(
          dailyForecast: dailyForecastDays,
          hourlyForecast: hourlyForecastHours,
          tempPreference: preferFahrenheight
              ? TemperatureUnit.fahrenheit
              : TemperatureUnit.celsius));
    }
  }

  void onHandlePickedPreferredTemperature(
      PickTemperaturePreference event, Emitter<PreferencesState> emit) async {}

  void onHandleHourlyForecastRange(
      PickHourlyForecastPeriod event, Emitter<PreferencesState> emit) async {}

  void onHandleDailyForecastRange(
      PickDailyForecastPeriod event, Emitter<PreferencesState> emit) async {}
}
