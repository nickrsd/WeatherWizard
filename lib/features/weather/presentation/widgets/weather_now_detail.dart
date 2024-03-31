import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_wizard/features/preferences/presentation/bloc/preferences_bloc.dart';
import 'package:weather_wizard/features/weather/data/models/weather_condition.dart';
import 'package:weather_wizard/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_wizard/features/weather/presentation/bloc/weather_event.dart';
import 'package:weather_wizard/features/weather/presentation/bloc/weather_state.dart';
import 'package:weather_wizard/features/wizard/presentation/bloc/wizard_bloc.dart';
import 'package:weather_wizard/features/wizard/presentation/bloc/wizard_event.dart';

class WeatherNow extends StatelessWidget {
  const WeatherNow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherBloc, WeatherState>(
      listener: (context, state) {
        if (state
            case WeatherUpdated(weather: var weather, message: final msg)) {
          context
              .read<WizardBloc>()
              .add(WizardCommentRequested(weather: weather, place: msg));
        }
        if (state is WeatherInitial) {
          final userData = context.watch<PreferencesBloc>().state;
          context.read<WeatherBloc>().add(WeatherRequested(
              location: userData.preferences.geolocation,
              dailyForecast: userData.preferences.dailyForecastDays,
              hourlyForecast: userData.preferences.hourlyForecastHours,
              temperatureUnit: userData.preferences.preferredUnits));
        }
      },
      buildWhen: (previous, current) {
        return current != previous;
      },
      builder: (context, weatherState) {
        if (weatherState case WeatherUpdated(weatherNow: var weather)) {
          return Stack(children: [
            weather.condition != null
                ? Positioned(
                    top: 90,
                    left: 70,
                    child: SizedBox(
                      height: 60,
                      child: Image(
                          image: AssetImage(
                              "assets/images/${WeatherConditionExtension.imagePath(weather.condition!)}")),
                    ),
                  )
                : const SizedBox.shrink(),
            Container(
              constraints: const BoxConstraints(minHeight: 150, maxHeight: 320),
              height: 200,
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 100,
                                child: Image.asset(
                                  "assets/images/tempIcon.png",
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ]),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50, left: 15),
                      child: Text(
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                          "${weather.temperature}°F"),
                    ),
                  ]),
            ),
          ]);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}


                        // Text(
                        //     style: const TextStyle(fontSize: 16),
                        //     "humidity: ${weather.relativeHumidity}"),
                        // Text(
                        //     style: const TextStyle(fontSize: 16),
                        //     "is day: ${weather.isDaytime}"),
                        // Text(
                        //     style: const TextStyle(fontSize: 16),
                        //     "chance of precipitation: ${weather.precipitationChance}"),