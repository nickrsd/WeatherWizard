import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_wizard/core/widgets/flamewisp_shader.dart';
import 'package:weather_wizard/features/wizard/presentation/widgets/wizard_animated.dart';

class WizardPrison extends StatelessWidget {
  const WizardPrison({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Image.asset("assets/images/prison_room.jpg", fit: BoxFit.fitHeight),
          const AnimatedPositioned(
              duration: Duration(seconds: 2),
              top: 55,
              left: 125,
              child: AnimatedWizard()),
          // const FlamewispWidget()
        ],
      ),
    );
  }
}
