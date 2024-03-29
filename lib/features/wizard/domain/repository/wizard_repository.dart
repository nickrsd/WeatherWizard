import 'package:weather_wizard/features/weather/domain/entities/weather.dart';

abstract class WizardRepository {
  Future<String> getWizardsWeatherComment(WeatherEntity weather, String? place);

  Future<Map<String, dynamic>> divineLocation(String query);
}
