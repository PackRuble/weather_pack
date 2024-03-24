import 'dart:convert';

import 'package:test/test.dart';
import 'package:weather_pack/src/services/weather/models/weather_current.dart'
    show parseCurrent;
import 'package:weather_pack/weather_pack.dart';

import 'source/source.dart';

// ignore_for_file: avoid_print

void main() {
  group('$WeatherCurrent', () {
    test('$WeatherCurrent.fromJson by source', () async {
      for (final jsonData in await weatherCurrentData) {
        final data = await json.decode(jsonData);

        final current =
            WeatherCurrent.fromJson(parseCurrent(data as Map<String, dynamic>));

        expect(current.runtimeType, WeatherCurrent);
        expect(current.temp, isNotNull);
        expect(current.date, isNotNull);
        expect(current.weatherMain, isNotNull);
        expect(current.toJson(), isNotEmpty);
      }
    });
  });

  group('$WeatherOneCall', () {
    test('$WeatherOneCall.fromJson by source', () async {
      for (final jsonData in await oneCallData) {
        final data = await json.decode(jsonData);

        final oneCall = WeatherOneCall.fromJson(data as Map<String, dynamic>);

        expect(oneCall.runtimeType, WeatherOneCall);
        expect(oneCall.longitude, isNotNull);
        expect(oneCall.latitude, isNotNull);
        expect(oneCall.current, isNotNull);
        expect(oneCall.minutely, isNotNull);
        expect(oneCall.hourly, isNotNull);
        expect(oneCall.daily, isNotNull);
        expect(oneCall.alerts, isNotNull);
      }
    });
  });
}
