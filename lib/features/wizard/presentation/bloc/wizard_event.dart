import 'package:equatable/equatable.dart';
import 'package:weather_wizard/features/weather/domain/entities/weather.dart';

sealed class WizardEvent extends Equatable {}

class WizardEnvisionedLocation extends WizardEvent {
  final String place;

  WizardEnvisionedLocation({required this.place});

  @override
  List<Object?> get props => [place];
}

class WizardCommentRequested extends WizardEvent {
  final WeatherEntity weather;
  final String place;

  WizardCommentRequested({required this.weather, required this.place});

  @override
  List<Object?> get props => [weather, place];
}
