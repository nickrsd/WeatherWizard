import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:weather_wizard/bloc_observer.dart';
import 'package:weather_wizard/core/theme/theme.dart';
import 'package:weather_wizard/features/location/data/repository/location_repository.dart';
import 'package:weather_wizard/features/location/domain/repository/location_repository.dart';
import 'package:weather_wizard/features/location/presentation/bloc/location_bloc.dart';
import 'package:weather_wizard/features/location/presentation/bloc/location_event.dart';
import 'package:weather_wizard/features/preferences/data/repository/preferences_repository.dart';
import 'package:weather_wizard/features/preferences/domain/repository/preferences_repository.dart';
import 'package:weather_wizard/features/preferences/presentation/bloc/preferences_bloc.dart';
import 'package:weather_wizard/features/preferences/presentation/bloc/preferences_event.dart';
import 'package:weather_wizard/features/weather/data/repository/weather_repository.dart';
import 'package:weather_wizard/features/weather/domain/repository/weather_repository.dart';
import 'package:weather_wizard/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_wizard/features/weather/presentation/page/weather_dashboard.dart';
import 'package:weather_wizard/features/wizard/data/repository/wizard_repository.dart';
import 'package:weather_wizard/features/wizard/domain/repository/wizard_repository.dart';
import 'package:weather_wizard/features/wizard/presentation/bloc/wizard_bloc.dart';

void main() {
  Gemini.init(apiKey: 'AIzaSyAE5BwRSbLBg7bX3EdR0RYs0RuhySr7qV4');
  Bloc.observer = const AppBlocObserver();
  final weatherRepository = WeatherRepositoryImpl();
  final locationRepository = LocationRepositoryImpl();
  final preferenceRepository = PreferencesRepositoryImpl();
  final wizardRepository = WizardRepositoryImpl();
  runApp(WeatherWizard(
      weatherRepository: weatherRepository,
      locationRepository: locationRepository,
      preferencesRepository: preferenceRepository,
      wizardRepository: wizardRepository));
}

class WeatherWizard extends StatelessWidget {
  final WeatherRepository _weatherRepository;
  final LocationRepository _locationRepository;
  final PreferencesRepository _preferenceRepository;
  final WizardRepository _wizardRepository;

  const WeatherWizard(
      {required WeatherRepository weatherRepository,
      required LocationRepository locationRepository,
      required PreferencesRepository preferencesRepository,
      required WizardRepository wizardRepository,
      super.key})
      : _weatherRepository = weatherRepository,
        _locationRepository = locationRepository,
        _preferenceRepository = preferencesRepository,
        _wizardRepository = wizardRepository;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WeatherRepository>.value(value: _weatherRepository),
        RepositoryProvider<LocationRepository>.value(
            value: _locationRepository),
        RepositoryProvider<PreferencesRepository>.value(
            value: _preferenceRepository),
        RepositoryProvider<WizardRepository>.value(value: _wizardRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PreferencesBloc>(
            create: (context) =>
                PreferencesBloc(context.read<PreferencesRepository>())
                  ..add(LoadPreferences()),
          ),
          BlocProvider<WeatherBloc>(
              create: (context) =>
                  WeatherBloc(context.read<WeatherRepository>())),
          BlocProvider<LocationBloc>(
            create: (context) =>
                LocationBloc(context.read<LocationRepository>())
                  ..add(RequestedLocation()),
          ),
          BlocProvider<WizardBloc>(
            create: (context) => WizardBloc(context.read<WizardRepository>()),
          ),
        ],
        child: MaterialApp(
          title: 'Weather Wizard',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appDarkTheme,
          home: Scaffold(
              backgroundColor: AppTheme.appDarkTheme.scaffoldBackgroundColor,
              body: const WeatherDashboard()),
        ),
      ),
    );
  }
}
