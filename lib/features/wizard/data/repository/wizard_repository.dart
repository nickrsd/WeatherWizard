import 'dart:convert';
import 'dart:math';

import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather.dart';
import 'package:weather_wizard/features/wizard/domain/repository/wizard_repository.dart';

/// Exception thrown when gemini fails to get us data
class GeminiResultsFailure extends Error {}

class WizardRepositoryImpl extends WizardRepository {
  @override
  Future<String> getWizardsWeatherComment(
      WeatherEntity weather, String? place) async {
    final shhhHesAWizard = Gemini.instance;

    final responseTypes = [
      "making a funny passive aggressive complaint",
      "whining about being trapped",
      "accidentally revealing how evil he is",
      "making a quippy comment",
      "sharing a factoid that is somehow selfish"
    ];

    final daylightToken = weather.weatherNow?.isDaytime != null
        ? weather.weatherNow!.isDaytime!
            ? "in daylight"
            : "at night"
        : "";

    final conditionToken = weather.weatherNow?.condition != null
        ? "${weather.weatherNow!.condition!.name} awaiting"
        : "unknown conditions";

    final tempToken = weather.weatherNow?.temperature != null
        ? "${weather.weatherNow!.temperature!}F"
        : "who knows what temperature";

    final humidityToken = weather.weatherNow?.relativeHumidity != null
        ? "${weather.weatherNow!.relativeHumidity!}% humidity"
        : "";

    final responseTopic = responseTypes[Random().nextInt(responseTypes.length)];

    final dynamicToken =
        "Respond in 55 characters or less by $responseTopic for his trip to predict weather at ${place ?? "the middle of nowhere"} $daylightToken, where it's $tempToken with $humidityToken with $conditionToken!";

    final geminiPrompt =
        "You're an old washed up evil wizard with lots of crazy stories trapped in an 8bit mobile world and forced teleport to 8bit versions of the world to divine weather predictions for the phone's owner, who has imprisoned you in their app. When you complain, it's quippy & funny old man stuff. When you comment, they're random stories of your crazy actions from the past related to the location. When you make requests, they're to be freed, avoid traveling, to going back home, all of which are either funny or attempts for sympathy. When you share factoids, they're about the location, and either factually, historically accurate, or from thousands of years ago and made up from your own world for this same location then. $dynamicToken";

    final result = await shhhHesAWizard.text(safetySettings: [
      SafetySetting(
          category: SafetyCategory.harassment,
          threshold: SafetyThreshold.blockOnlyHigh),
      SafetySetting(
          category: SafetyCategory.dangerous,
          threshold: SafetyThreshold.blockOnlyHigh),
      SafetySetting(
          category: SafetyCategory.hateSpeech,
          threshold: SafetyThreshold.blockOnlyHigh),
      SafetySetting(
          category: SafetyCategory.sexuallyExplicit,
          threshold: SafetyThreshold.blockOnlyHigh),
    ], geminiPrompt);
    if (result != null && result.output != null) {
      return result.output!;
    } else {
      throw GeminiResultsFailure;
    }
  }

  @override
  Future<Map<String, dynamic>> divineLocation(String query) async {
    final gemini = Gemini.instance;

    const String codeFormat =
        "{'latitude': <double>,'longitude': <double>,'name': <name>,'description': <String>}";
    const String instructions =
        "When I give you a phrase, that phrase is a description that is intended to describe a place on earth in some way, and your role is to act as an AI backed API server that only relies on factual data it knows about the world. My request might be a single word, like 'Chicago', or as fantastical as 'the center of Mordor', you'll always select a real latitude and longitude that matches, even if the best you can do is pick the best matching real world place. All your responses will only include a json string (don't format with a  ```json ``` style code block), with properties for latitude, longitude, name, and description. The name should always be a name that would be searchable in map databases like google maps, the description is a one sentence summary of why you chose this location. Your json response will be in the following format, replace <type> placeholders with values formatted for that type. Round doubles to 3 decimal places. Wrap the entire response in double quotes";
    final String prompt =
        "$instructions $codeFormat Your role begins now, respond to the query for the phrase: '$query'";

    final result = await gemini.text(safetySettings: [
      SafetySetting(
          category: SafetyCategory.harassment,
          threshold: SafetyThreshold.blockOnlyHigh),
      SafetySetting(
          category: SafetyCategory.dangerous,
          threshold: SafetyThreshold.blockOnlyHigh),
    ], prompt);

    if (result != null && result.output != null) {
      final String noncodeString = result.output!.split("```").firstWhere(
            (element) => element.isNotEmpty,
          );
      return jsonDecode(noncodeString) as Map<String, dynamic>;
    } else {
      throw GeminiResultsFailure;
    }
  }
}
