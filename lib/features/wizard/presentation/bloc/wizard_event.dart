import 'package:weather_wizard/features/weather/domain/entities/weather.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather_now.dart';

sealed class WizardEvent {}

class WizardEnvisionedLocation extends WizardEvent {
  String place;

  WizardEnvisionedLocation({required this.place});
}

class WizardCommentRequested extends WizardEvent {
  WeatherEntity weather;
  String place;

  WizardCommentRequested({required this.weather, required this.place});
}
