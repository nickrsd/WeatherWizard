import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AutosizingSvgTextbox extends StatelessWidget {
  final String svgAsset;
  final Color tintColor;
  // final List<Widget> children;

  const AutosizingSvgTextbox(
      {super.key, this.tintColor = Colors.grey, required this.svgAsset});

  // "assets/images/chat_box.svg"

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset("assets/images/chat_box.svg",
        semanticsLabel: 'Wizard Response Container',
        fit: BoxFit.fill,
        colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn));
  }
}

class WizardResponse extends StatelessWidget {
  final String message;
  final int typingSpeed;
  final bool shouldLoop;

  const WizardResponse(
      {required this.message,
      this.typingSpeed = 115,
      this.shouldLoop = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Stack(children: [
        SizedBox(
          height: message.length > 110 ? 80 : 60,
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
              isRepeatingAnimation: shouldLoop,
              animatedTexts: [
                TyperAnimatedText(message,
                    speed: Duration(milliseconds: typingSpeed),
                    textStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))
              ]),
        ),
      ]),
    );
  }
}
