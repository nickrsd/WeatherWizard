import 'package:bloc/bloc.dart';
import 'package:weather_wizard/core/common/geolocation.dart';
import 'package:weather_wizard/core/common/place.dart';
import 'package:weather_wizard/features/wizard/data/model/wizard.dart';
import 'package:weather_wizard/features/wizard/data/repository/wizard_repository.dart';
import 'package:weather_wizard/features/wizard/domain/repository/wizard_repository.dart';
import 'package:weather_wizard/features/wizard/presentation/bloc/wizard_event.dart';
import 'package:weather_wizard/features/wizard/presentation/bloc/wizard_state.dart';

class WizardBloc extends Bloc<WizardEvent, WizardState> {
  final WizardRepository _wizardRepository;

  WizardBloc(this._wizardRepository) : super(WizardInitial()) {
    on<WizardCommentRequested>(onWizardCommentRequested);
    on<WizardEnvisionedLocation>(onWizardEnvisionedLocation);
  }

  void onWizardEnvisionedLocation(
      WizardEnvisionedLocation event, Emitter<WizardState> emit) async {
    try {
      final {
        'latitude': double aiPoweredLatitude,
        'longitude': double aiPoweredLongitude,
        'name': String aiProvidedName,
        'description': String aiPoweredDescription,
        'feature': String aiPoweredLocationFeature
      } = await _wizardRepository.divineLocation(event.place);

      emit(WizardDivinedLocation(
        place: PlaceDescriptor(
            name: aiProvidedName,
            notableFeature: aiPoweredLocationFeature,
            description: aiPoweredDescription,
            location: Geolocation(
                latitude: aiPoweredLatitude, longitude: aiPoweredLongitude)),
      ));
    } on GeminiResultsFailure catch (_) {
      emit(WizardFailedDiviniation(
          message: WizardCringeyComment.nothingAt(event.place)));
    }
  }

  void onWizardCommentRequested(
      WizardCommentRequested event, Emitter<WizardState> emit) async {
    final message = await _wizardRepository.getWizardsWeatherComment(
        event.weather, event.place);

    emit(WizardCommented(
        primaryComment: message, secondaryTopic: "<quip for humidity>"));
  }
}
