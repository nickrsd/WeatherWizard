import 'package:flutter_test/flutter_test.dart';
import 'package:weather_wizard/features/weather/data/models/weather_condition.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_condition.dart';

void main() {
  group("WeatherCondition from numbers", () {
    test(
        "Valid instance from Int",
        () => expect(
            WeatherConditionExtension.fromCode(0), WeatherCondition.clearSky));
    test("falls back to unknown", () {
      final fractionalCondition = WeatherConditionExtension.fromCode(1.5);
      expect(fractionalCondition, WeatherCondition.unknown);
    });
  });
}
