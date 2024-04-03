import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_wizard/core/common/geolocation.dart';
import 'package:weather_wizard/core/common/place.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather.dart';
import 'package:weather_wizard/features/wizard/presentation/bloc/wizard_state.dart';

class MockWizardWeather extends Mock implements WeatherEntity {}

void main() {
  group('WizardState', () {
    const PlaceDescriptor testPlaceDescriptor = PlaceDescriptor(
      name: 'Mt Doom',
      feature: '2,286m high volcano of death.',
      description: 'You asked for somewhere hot, here you go.',
      location: Geolocation(latitude: 0.0, longitude: 0.0),
    );
    const String testPrimaryComment = 'Looks like a storm coming';
    const String testSecondaryTopic = 'Tornadoes';

    test('WizardDivinedLocation holds correct data', () {
      final state = WizardDivinedLocation(place: testPlaceDescriptor);

      expect(state.place, testPlaceDescriptor);
    });

    test('WizardCommented holds correct data', () {
      final state = WizardCommented(
          primaryComment: testPrimaryComment,
          secondaryTopic: testSecondaryTopic);

      expect(state.primaryComment, testPrimaryComment);
      expect(state.secondaryTopic, testSecondaryTopic);
    });

    test('WizardFailedDiviniation holds correct data', () {
      const String testMessage = 'Failed to divine location';
      final state = WizardFailedDiviniation(message: testMessage);

      expect(state.message, testMessage);
      // Location is optional, testing its default null state
      expect(state.location, isNull);
    });
  });
}
