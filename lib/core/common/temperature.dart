enum TemperatureUnit { fahrenheit, celsius }

extension TemperatureUnitExtension on TemperatureUnit {
  String get labelString => this == TemperatureUnit.fahrenheit ? "°F" : "°C";
}
