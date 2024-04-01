import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_wizard/features/weather/data/models/weather_condition.dart';
import 'package:weather_wizard/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_wizard/features/weather/presentation/bloc/weather_state.dart';

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state
              case WeatherUpdated(
                dailyForecast: final days,
                hourlyForecast: final hours
              )) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: days.length,
              itemExtent: 120,
              itemBuilder: (context, index) {
                final day = days[index];
                final assetPath =
                    "assets/images/${WeatherConditionExtension.imagePath(day.condition!)}";
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage("assets/images/pixel_card_white.png"),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      child: Stack(
                          alignment: Alignment.center,
                          // mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 65,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 45),
                                child: Image(image: AssetImage(assetPath)),
                              ),
                            ),
                            // const Positioned(
                            //   left: 70,
                            //   top: 65,
                            //   child: SizedBox(
                            //     width: 25,
                            //     child: Padding(
                            //       padding: EdgeInsets.only(top: 35),
                            //       child: Image(
                            //           image: AssetImage(
                            //               "assets/images/temp_fahrenheit_logo.png")),
                            //     ),
                            //   ),
                            // ),
                            Positioned(
                              top: 118,
                              left: 20,
                              child: Text(
                                  style: const TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'ponde',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                  '${day.minTemperature}°F'),
                            ),
                            Positioned(
                              top: 145,
                              left: 32,
                              child: Text(
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'ponde',
                                      fontSize: 17),
                                  '${day.maxTemperature}°F'),
                            ),
                            Text('${day.time}')
                          ])),
                );
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
