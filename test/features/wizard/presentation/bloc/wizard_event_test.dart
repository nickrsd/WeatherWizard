import 'package:flutter_test/flutter_test.dart';
import 'package:weather_wizard/features/weather/data/models/weather_now.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_condition.dart';
import 'package:weather_wizard/features/wizard/presentation/bloc/wizard_event.dart';

import '../../../../mocks.dart';

void main() {
  const mockUserSearch = "Mt Doom of Middle Earth";

  group('WizardEvent', () {
    WeatherNow mockWeatherNow = const WeatherNow(
        temperature: 74.6,
        relativeHumidity: 48,
        condition: WeatherCondition.clearSky,
        isDaytime: true,
        precipitationChance: 27,
        time: '2024-03-31T02:30');

    WeatherEntity weatherEntity = WeatherEntity(
        weatherNow: mockWeatherNow,
        dailyForecast: const [],
        hourlyForecast: const []);

    setUp(() {});

    test('WizardEnvisionedLocation holds correct data', () {
      final event = WizardEnvisionedLocation(place: mockUserSearch);
      expect(event.place, mockUserSearch);
    });

    test('WizardCommentRequested holds correct data', () {
      final event =
          WizardCommentRequested(weather: weatherEntity, place: mockUserSearch);

      expect(event.weather, weatherEntity);
      expect(event.place, mockUserSearch);
    });

    group('WizardEvent Equality', () {
      const String testPlace = 'Emerald City';
      final WeatherEntity testWeather = weatherEntity;

      test('WizardEnvisionedLocation instances with same place are equal', () {
        expect(
          WizardEnvisionedLocation(place: testPlace),
          WizardEnvisionedLocation(place: testPlace),
        );
      });

      test(
          'WizardCommentRequested instances with same weather and place are equal',
          () {
        expect(
          WizardCommentRequested(weather: weatherEntity, place: testPlace),
          WizardCommentRequested(weather: weatherEntity, place: testPlace),
        );
      });
    });
  });
}
