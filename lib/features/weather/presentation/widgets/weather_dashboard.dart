import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_wizard/features/location/presentation/location_search.dart';
import 'package:weather_wizard/features/preferences/presentation/bloc/preferences_bloc.dart';
import 'package:weather_wizard/features/preferences/presentation/bloc/preferences_state.dart';
import 'package:weather_wizard/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_wizard/features/weather/presentation/bloc/weather_event.dart';
import 'package:weather_wizard/features/weather/presentation/widgets/weather_forecast_tarot.dart';
import 'package:weather_wizard/features/weather/presentation/widgets/weather_now_detail.dart';
import 'package:weather_wizard/features/wizard/presentation/bloc/wizard_bloc.dart';
import 'package:weather_wizard/features/wizard/presentation/bloc/wizard_event.dart';
import 'package:weather_wizard/features/wizard/presentation/bloc/wizard_state.dart';
import 'package:weather_wizard/features/wizard/presentation/wizard_prison.dart';

class WeatherDashboard extends StatelessWidget {
  const WeatherDashboard({super.key});

  // Title for the weather page, stack of labels with values

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(children: [
          Container(
            constraints: const BoxConstraints(minHeight: 150, maxHeight: 320),
            child: ClipRRect(
                child: Align(
              widthFactor: 2.0,
              heightFactor: 2.0,
              child: Image.asset(
                "assets/images/rainy.gif",
                fit: BoxFit.cover,
                scale: 0.1,
              ),
            )),
          ),
          BlocListener<WizardBloc, WizardState>(
            listener: (context, state) {
              final preferences =
                  context.read<PreferencesBloc>().state as UpdatedPreferences;
              if (state case WizardDivinedLocation(location: final loc)
                  when preferences.dailyForecast != null) {
                context.read<WeatherBloc>().add(WeatherRequested(
                    location: loc,
                    dailyForecast: preferences.dailyForecast,
                    hourlyForecast: preferences.hourlyForecast,
                    temperatureUnit: preferences.tempPreference));
              }
            },
            child: const WeatherNow(),
          )
        ]
            // const SizedBox(height: 80),
            ),
        const WizardPrison(),
        const SizedBox(height: 20),
        const GeolocationSearch(),
        const WeatherForecast(),
      ],
    ));
  }
}
