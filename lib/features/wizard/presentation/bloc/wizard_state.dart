import 'package:equatable/equatable.dart';
import 'package:weather_wizard/core/common/geolocation.dart';
import 'package:weather_wizard/core/common/place.dart';

sealed class WizardState extends Equatable {}

class WizardInitial extends WizardState {
  @override
  List<Object?> get props => [];
}

class WizardDivinedLocation extends WizardState {
  final PlaceDescriptor place;

  WizardDivinedLocation({required this.place});

  @override
  List<Object?> get props => [place];
}

class WizardBusy extends WizardState {
  @override
  List<Object?> get props => [];
}

class WizardCommented extends WizardState {
  final String primaryComment;
  final String secondaryTopic;

  WizardCommented({required this.primaryComment, required this.secondaryTopic});

  @override
  List<Object?> get props => [primaryComment, secondaryTopic];
}

class WizardFailedDiviniation extends WizardState {
  final Geolocation? location;
  final String message;

  WizardFailedDiviniation({this.location, required this.message});

  @override
  List<Object?> get props => [location, message];
}
