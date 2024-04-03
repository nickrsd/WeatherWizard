import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_wizard/features/wizard/presentation/bloc/wizard_bloc.dart';
import 'package:weather_wizard/features/wizard/presentation/bloc/wizard_state.dart';
import 'package:weather_wizard/features/wizard/presentation/widgets/wizard_prison.dart';
import 'package:weather_wizard/features/wizard/presentation/widgets/wizard_response.dart';

class WizardLayout extends StatelessWidget {
  const WizardLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const WizardPrison(),
        BlocBuilder<WizardBloc, WizardState>(builder: (context, state) {
          return switch (state) {
            WizardCommented(primaryComment: final mainResponse) =>
              WizardResponse(message: mainResponse, typingSpeed: 90),
            WizardFailedDiviniation(message: final msg) =>
              WizardResponse(message: msg),
            WizardBusy() || WizardDivinedLocation() => const WizardResponse(
                message: '................................',
                typingSpeed: 35,
                shouldLoop: true),
            WizardInitial() => const WizardResponse(
                message:
                    "Divining the weather again am I? Well, let's get on with it then, I don't have all day.",
                typingSpeed: 100),
          };
        }),
      ],
    );
  }
}
