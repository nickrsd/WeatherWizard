import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        ]
            // const SizedBox(height: 80),
            ),
        // const WeatherForecast(),
        const WizardPrison(),
        const SizedBox(height: 20),
      ],
    ));
  }
}
