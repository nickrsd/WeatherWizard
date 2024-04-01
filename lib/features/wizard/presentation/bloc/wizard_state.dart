import 'package:weather_wizard/core/common/geolocation.dart';
import 'package:weather_wizard/core/common/place.dart';

sealed class WizardState {}

class WizardInitial extends WizardState {}

class WizardDivinedLocation extends WizardState {
  PlaceDescriptor place;

  WizardDivinedLocation({required this.place});
}

class WizardBusy extends WizardState {}

class WizardCommented extends WizardState {
  final String primaryComment;
  final String secondaryTopic;

  WizardCommented({required this.primaryComment, required this.secondaryTopic});
}

// class WizardBroadcastedThoughts extends WizardState {
//   final String topicalComment;
//   final Set<String> keyedThoughts;

//   WizardBroadcastedThoughts(
//       {required this.topicalComment, required this.keyedThoughts});
// }

class WizardFailedDiviniation extends WizardState {
  Geolocation? location;
  String message;

  WizardFailedDiviniation({this.location, required this.message});
}
