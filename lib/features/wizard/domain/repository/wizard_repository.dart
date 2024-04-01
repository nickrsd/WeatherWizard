import 'package:weather_wizard/features/weather/domain/entities/weather.dart';

typedef WizardCommentResponse = String;
typedef WizardDivineLocationResponse = Map<String, dynamic>;

abstract class WizardRepository {
  Stream<WizardCommentResponse> get weatherResponse;

  Stream<WizardDivineLocationResponse> get locationResponse;

  void publishWizardsWeatherCommentRequest(
      WeatherEntity weather, String? place);
  Future<String> getWizardsWeatherComment(WeatherEntity weather, String? place);

  void publishDivineLocationRequest(String query);
  Future<Map<String, dynamic>> divineLocation(String query);
}
