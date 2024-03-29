import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_wizard/core/theme/theme.dart';
import 'package:weather_wizard/features/location/data/repository/location_repository.dart';
import 'package:weather_wizard/features/location/domain/repository/location_repository.dart';
import 'package:weather_wizard/features/location/presentation/bloc/location_bloc.dart';
import 'package:weather_wizard/features/preferences/data/repository/preferences_repository.dart';
import 'package:weather_wizard/features/preferences/domain/repository/preferences_repository.dart';
import 'package:weather_wizard/features/preferences/presentation/bloc/preferences_bloc.dart';
import 'package:weather_wizard/features/preferences/presentation/bloc/preferences_event.dart';
import 'package:weather_wizard/features/weather/data/repository/weather_repository.dart';
import 'package:weather_wizard/features/weather/domain/repository/weather_repository.dart';
import 'package:weather_wizard/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_wizard/features/weather/presentation/weather_dashboard.dart';

void main() {
  final weatherRepository = WeatherRepositoryImpl();
  final locationRepository = LocationRepositoryImpl();
  final preferenceRepository = PreferencesRepositoryImpl();
  runApp(WeatherWizard(
      weatherRepository: weatherRepository,
      locationRepository: locationRepository,
      preferencesRepository: preferenceRepository));
}

class WeatherWizard extends StatelessWidget {
  final WeatherRepository _weatherRepository;
  final LocationRepository _locationRepository;
  final PreferencesRepository _preferenceRepository;

  const WeatherWizard(
      {required WeatherRepository weatherRepository,
      required LocationRepository locationRepository,
      required PreferencesRepository preferencesRepository,
      super.key})
      : _weatherRepository = weatherRepository,
        _locationRepository = locationRepository,
        _preferenceRepository = preferencesRepository;

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
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<WeatherBloc>(
              create: (context) =>
                  WeatherBloc(context.read<WeatherRepository>())),
          BlocProvider<LocationBloc>(
            create: (context) =>
                LocationBloc(context.read<LocationRepository>()),
          ),
          BlocProvider<PreferencesBloc>(
            create: (context) =>
                PreferencesBloc(context.read<PreferencesRepository>())
                  ..add(LoadPreferences()),
          )
        ],
        child: MaterialApp(
          title: 'Weather Wizard',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appDarkTheme,
          home: Scaffold(
              backgroundColor: AppTheme.appDarkTheme.scaffoldBackgroundColor,
              appBar: AppBar(),
              body: const WeatherDashboard()),
        ),
      ),
    );
  }
}
