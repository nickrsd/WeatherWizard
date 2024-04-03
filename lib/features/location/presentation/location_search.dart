import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_wizard/features/wizard/presentation/bloc/wizard_bloc.dart';
import 'package:weather_wizard/features/wizard/presentation/bloc/wizard_event.dart';

class GeolocationSearch extends StatefulWidget {
  const GeolocationSearch({super.key});

  @override
  State<GeolocationSearch> createState() => _GeolocationSearchState();
}

class _GeolocationSearchState extends State<GeolocationSearch> {
  final TextEditingController _textController = TextEditingController();

  String get _text => _textController.text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
            minWidth: 300,
            maxWidth: double.infinity,
            minHeight: 60,
            maxHeight: 160),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    labelText: "Request evil wizard's divination",
                    hintText: "Seattle, coldest place, a world wonder",
                  ),
                ),
              ),
            ),
            IconButton(
                key: const Key('auto_fix_high_outlined'),
                icon: const Icon(Icons.auto_fix_high_outlined,
                    semanticLabel: 'Submit'),
                iconSize: 32,
                onPressed: () {
                  context
                      .read<WizardBloc>()
                      .add(WizardEnvisionedLocation(place: _text));
                }),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

      // LocationUpdated(message: final msg) =>
      //   BlocBuilder<WeatherBloc, WeatherState>(
      //     // buildWhen: (previous, current) =>
      //     //     current is WizardCommented && previous != current,
      //     builder: (context, state) {
      //       if (state
      //           case WizardCommented(
      //             primaryComment: final mainResponse,
      //             secondaryTopic: String adjacentResponse
      //           )) {
      //         return _buildAnimatedText(mainResponse, 90, false);
      //       } else {
      //         return _buildAnimatedText(
      //             '................................', 35, true);
      //       }
      //     },
      //   ),
      // LocationSearchFailed(message: final msg) =>
      //   _buildAnimatedText(msg, 115, false),
      // LocationLoading() =>
      //   _buildAnimatedText('..........................', 65, true),
      // LocationUnknown() => _buildAnimatedText(
      //     "Divining the weather again am I? Well, let's get on with it then, I don't have all day.",
      //     100,
      //     false),
      // WizardInitial() => const SizedBox.shrink()