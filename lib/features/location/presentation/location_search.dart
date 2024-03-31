import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_wizard/features/wizard/presentation/bloc/wizard_bloc.dart';
import 'package:weather_wizard/features/wizard/presentation/bloc/wizard_event.dart';
import 'package:weather_wizard/features/wizard/presentation/bloc/wizard_state.dart';

class GeolocationSearch extends StatefulWidget {
  const GeolocationSearch({super.key});

  @override
  State<GeolocationSearch> createState() => _GeolocationSearchState();
}

class _GeolocationSearchState extends State<GeolocationSearch> {
  final TextEditingController _textController = TextEditingController();

  String get _text => _textController.text;

  Widget _buildAnimatedText(String message, int typingDuration, bool repeats) {
    return Stack(children: [
      SizedBox(
        height: 100,
        width: double.infinity,
        child: Stack(children: [
          Positioned.fill(
            top: 6,
            left: 6,
            child: Container(
              color: Colors.grey,
              child: const SizedBox.expand(),
            ),
          ),
          SvgPicture.asset("assets/images/chat_box.svg",
              semanticsLabel: 'Chat Box',
              fit: BoxFit.fill,
              colorFilter:
                  const ColorFilter.mode(Colors.grey, BlendMode.srcIn)),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: AnimatedTextKit(
            key: ValueKey<String>(message),
            isRepeatingAnimation: repeats,
            animatedTexts: [
              TyperAnimatedText(message,
                  speed: Duration(milliseconds: typingDuration),
                  textStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black))
            ]),
      ),
    ]);
  }

  Widget _buildWizardText(WizardState state) {
    return switch (state) {
      WizardCommented(
        primaryComment: final mainResponse,
        secondaryTopic: String adjacentResponse
      ) =>
        _buildAnimatedText(mainResponse, 90, false),
      WizardFailedDiviniation(message: final msg) =>
        _buildAnimatedText(msg, 115, false),
      WizardBusy() ||
      WizardDivinedLocation() =>
        _buildAnimatedText('................................', 35, true),
      WizardInitial() => _buildAnimatedText(
          "Divining the weather again am I? Well, let's get on with it then, I don't have all day.",
          100,
          false),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<WizardBloc, WizardState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: _buildWizardText(state)),
                ],
              );
            },
          ),
          ConstrainedBox(
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
                        labelText: "Request evil wizard's weather divination",
                        hintText:
                            "The coldest place | Chicago-ish | wizard's pick",
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
        ],
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