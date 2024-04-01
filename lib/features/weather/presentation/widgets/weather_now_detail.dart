import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_wizard/features/weather/data/models/weather_condition.dart';
import 'package:weather_wizard/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_wizard/features/weather/presentation/bloc/weather_state.dart';
import 'package:weather_wizard/features/wizard/presentation/bloc/wizard_bloc.dart';
import 'package:weather_wizard/features/wizard/presentation/bloc/wizard_event.dart';

class WeatherNow extends StatelessWidget {
  const WeatherNow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      // buildWhen: (previousState, state) =>
      //     (state is CurrentWeatherUpdate && state != previousState) ||
      //     state is CurrentWeatherLoading,
      builder: (context, state) {
        if (state
            case WeatherUpdated(weather: var weather, place: final place)) {
          context
              .read<WizardBloc>()
              .add(WizardCommentRequested(weather: weather, place: place.name));
        }
        if (state is WeatherInitial) {
          final userData = context.watch<PreferencesBloc>().state;
          context.read<WeatherBloc>().add(WeatherRequested(
              place: PlaceDescriptor(
                  name: '',
                  feature: '',
                  description: '',
                  location: userData.preferences.geolocation),
              dailyForecast: userData.preferences.dailyForecastDays,
              hourlyForecast: userData.preferences.hourlyForecastHours,
              temperatureUnit: userData.preferences.preferredUnits));
        }
      },
      buildWhen: (previous, current) {
        return current != previous;
      },
      builder: (context, weatherState) {
        return switch (weatherState) {
          WeatherUpdated(weatherNow: final weather, place: final place) =>
            _WeatherNowLabelsTwo(weather: weather, place: place),
          WeatherLoading() || WeatherInitial() => const SizedBox.shrink()
        };
      },
    );
  }
}

class _WeatherNowLabelsTwo extends StatelessWidget {
  const _WeatherNowLabelsTwo(
      {required this.weather, required this.place, super.key});

  final WeatherNowEntity weather;
  final PlaceDescriptor place;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                              style: const TextStyle(shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(-3.0, 3.0),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                )
                              ], fontFamily: 'crang', fontSize: 32),
                              place.name),
                          const Text(
                              style: TextStyle(
                                fontFamily: 'crang',
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(-1.0, 1.0),
                                    blurRadius: 3.0,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  )
                                ],
                              ),
                              "  feels like  "),
                          Text(
                              style: const TextStyle(shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(-1.0, 1.0),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                )
                              ], fontFamily: 'crang', fontSize: 32),
                              "${weather.temperature?.round()}°F"),
                        ]),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: SizedBox(
                          width: 300,
                          child: Text(
                              style: const TextStyle(shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(-0.5, -0.5),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                )
                              ], fontFamily: 'crang', fontSize: 14),
                              place.feature),
                        ),
                      ),
                      weather.condition != null
                          ? SizedBox(
                              width: 60,
                              child: Image(
                                image: AssetImage(
                                    "assets/images/${WeatherConditionExtension.imagePath(weather.condition!)}"),
                              ))
                          : const SizedBox.shrink(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 15),
                    child: Row(children: [
                      SizedBox(
                        width: 40,
                        child: Image.asset(
                          "assets/images/tempIcon.png",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                            style: const TextStyle(shadows: <Shadow>[
                              Shadow(
                                offset: Offset(-1.0, 1.0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              )
                            ], fontFamily: 'crang', fontSize: 24),
                            "${weather.temperature?.round()}°F"),
                      ),
                      SizedBox(
                        width: 36,
                        child: Image.asset(
                          "assets/images/pixel_detail_humidity.png",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                            style: const TextStyle(shadows: <Shadow>[
                              Shadow(
                                offset: Offset(-1.0, 1.0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              )
                            ], fontFamily: 'crang', fontSize: 24),
                            "${weather.relativeHumidity?.round()}%"),
                      ),
                    ]),
                  )
                ]),
            // Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       weather.condition != null
            //           ? SizedBox(
            //               width: 80,
            //               child: Image(
            //                 image: AssetImage(
            //                     "assets/images/${WeatherConditionExtension.imagePath(weather.condition!)}"),
            //               ))
            //           : const SizedBox.shrink(),
            //     ])
          ]),
    );
  }
}

class _WeatherNowLabels extends StatelessWidget {
  const _WeatherNowLabels(
      {required this.weather, required this.place, super.key});

  final WeatherNowEntity weather;
  final PlaceDescriptor place;

  @override
  Widget build(BuildContext context) {
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
        // constraints: const BoxConstraints(minHeight: 150, maxHeight: 320),
        height: 400,
        width: 300,
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
      Positioned(
        top: 150,
        child: Column(children: [
          Text(style: const TextStyle(fontFamily: 'crang'), place.name),
          Text(style: const TextStyle(fontFamily: 'crang'), place.feature)
        ]),
      )
    ]);
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