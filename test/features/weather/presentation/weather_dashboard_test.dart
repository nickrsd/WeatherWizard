import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_wizard/features/weather/presentation/widgets/weather_dashboard.dart';

void main() {
  testWidgets('MyWidget has a title and message', (tester) async {
    await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: WeatherDashboard())));

    final tempFinder = find.text('temperature:');
    final humidityFinder = find.text('humidity:');

    expect(tempFinder, findsOneWidget);
    expect(humidityFinder, findsOneWidget);
  });
}
