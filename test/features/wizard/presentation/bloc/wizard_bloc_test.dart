
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_wizard/core/common/geolocation.dart';
import 'package:weather_wizard/core/common/place.dart';
import 'package:weather_wizard/features/weather/data/models/weather_now.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_condition.dart';
import 'package:weather_wizard/features/wizard/data/repository/wizard_repository.dart';
import 'package:weather_wizard/features/wizard/presentation/bloc/wizard_bloc.dart';
import 'package:weather_wizard/features/wizard/presentation/bloc/wizard_event.dart';
import 'package:weather_wizard/features/wizard/presentation/bloc/wizard_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  late MockWizardRepository mockWizardRepository;

  const mockUserSearch = "Somewhere around Chicago";

  const mockLocation = Geolocation(latitude: 0.0, longitude: 0.0);

  const mockWeatherNow = WeatherNow(
      temperature: 74.6,
      relativeHumidity: 48,
      condition: WeatherCondition.clearSky,
      isDaytime: true,
      precipitationChance: 27,
      time: '2024-03-31T02:30');

  const mockWeather = WeatherEntity(
      weatherNow: mockWeatherNow, dailyForecast: [], hourlyForecast: []);

  final mockWizardWeatherResponse = WizardCommented(
      primaryComment: "this chilly weather is a bunch of bs",
      secondaryTopic: "sweatier than a tryhard FPS player");

  // Define the data that will be returned by the mock.
  const mockPlaceData = PlaceDescriptor(
      name: 'Chicago',
      feature: 'Has Willis (formly sears) tower, which is neat',
      description:
          'Picked because you wanted somewhere around chicago, so why not chicago.',
      location: mockLocation);

  final Map<String, dynamic> mockDivineResponse = {
    ...mockPlaceData.toJson(),
    ...mockLocation.toJson()
  };

  setUpAll(() {
    registerFallbackValue(mockWeather);
  });

  setUp(() {
    mockWizardRepository = MockWizardRepository();
    reset(mockWizardRepository);
  });

  tearDown(() {});

  group('WizardBloc', () {
    group(
        'Natural language event queries resolve to geocoordinate(success) or message(error) data',
        () {
      blocTest<WizardBloc, WizardState>(
          'emits the [WizardEnvisionedLocation] state after resolving [WizardDivinedlocation] event to translate natural language text into best matching Geocoordinates & metadata',
          setUp: () {
            when(
              () => mockWizardRepository.divineLocation(any()),
            ).thenAnswer((_) async => Future<void>.delayed(Durations.short1)
                .then((value) => mockDivineResponse));
          },
          build: () => WizardBloc(mockWizardRepository),
          act: (bloc) =>
              bloc.add(WizardEnvisionedLocation(place: mockUserSearch)),
          wait: Durations.long1,
          expect: () => [isA<WizardDivinedLocation>()],
          verify: (_) {
            verify(() => mockWizardRepository.divineLocation(any())).called(1);
          });

      blocTest<WizardBloc, WizardState>(
          'emit [WizardFailedDivination] if an attempt to [DivineLocation] for coordinates fails for some reason and throws [GeminiResultsFailure]',
          setUp: () {
            when(() => mockWizardRepository.divineLocation(any()))
                .thenThrow(GeminiResultsFailure());
          },
          build: () => WizardBloc(mockWizardRepository),
          act: (bloc) =>
              bloc.add(WizardEnvisionedLocation(place: mockUserSearch)),
          wait: Durations.long1,
          expect: () => [isA<WizardFailedDiviniation>()],
          verify: (_) {
            verify(() => mockWizardRepository.divineLocation(any())).called(1);
          });
    });

    group(
        'Events for data contextual wizard commentary, such as weather, emit states with commentary(success) or message(error) data',
        () {
      blocTest<WizardBloc, WizardState>(
          'When wanting the AI response for the weather by using using [WizardCommentRequested], resolve in emitting [WizardCommentRequested] state, which contains the full response data.',
          setUp: () {
            when(
              () => mockWizardRepository.getWizardsWeatherComment(any(), any()),
            ).thenAnswer((_) async => Future<void>.delayed(Durations.short1)
                .then((value) => mockWizardWeatherResponse.primaryComment));
          },
          build: () => WizardBloc(mockWizardRepository),
          act: (bloc) => bloc.add(WizardCommentRequested(
              weather: MockWizardWeather(), place: mockPlaceData.name)),
          wait: Durations.long1,
          expect: () => [isA<WizardCommented>()],
          verify: (_) {
            verify(() =>
                    mockWizardRepository.getWizardsWeatherComment(any(), any()))
                .called(1);
          });

      blocTest<WizardBloc, WizardState>(
          'emit [WizardFailedDivination] when an [WizardCommentRequested] for the wizards weather response fails and throws [GeminiResultsFailure]',
          setUp: () {
            when(() =>
                    mockWizardRepository.getWizardsWeatherComment(any(), any()))
                .thenThrow(GeminiResultsFailure());
          },
          build: () => WizardBloc(mockWizardRepository),
          act: (bloc) => bloc.add(WizardCommentRequested(
              weather: MockWizardWeather(), place: mockPlaceData.name)),
          wait: Durations.long1,
          expect: () => [isA<WizardFailedDiviniation>()],
          verify: (_) {
            verify(() =>
                    mockWizardRepository.getWizardsWeatherComment(any(), any()))
                .called(1);
          });
    });
  });
}
