enum TemperatureUnit { fahrenheit, celsius }

extension TemperatureUnitExtension on TemperatureUnit {
  String get labelString => this == TemperatureUnit.fahrenheit ? "°F" : "°C";

  static TemperatureUnit? fromString(String name) {
    switch (name) {
      case "fahrenheit":
        return TemperatureUnit.fahrenheit;
      case "celsius":
        return TemperatureUnit.celsius;
      default:
        return null;
    }
  }
}
