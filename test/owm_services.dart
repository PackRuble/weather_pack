import 'package:test/test.dart';
import 'package:weather_pack/weather_pack.dart';

import 'tested_apikey.dart';

// ignore: unreachable_from_main
const apikey = testedApikey;

void main() {
  late WeatherService wService;
  late GeocodingService gService;

  setUpAll(() {
    wService = WeatherService(apikey);
    gService = GeocodingService(apikey);
  });

  group('$WeatherService', () {
    test('$WeatherService.currentWeatherByLocation', () async {
      final currentWeather = await wService.currentWeatherByLocation(
        latitude: 55.752004,
        longitude: 37.617734,
      );

      expect(currentWeather, isA<WeatherCurrent>());
    });

    test('$WeatherService.oneCallWeatherByLocation', () async {
      final onecallWeather = await wService.oneCallWeatherByLocation(
        latitude: 55.752004,
        longitude: 37.617734,
      );

      expect(onecallWeather, isA<WeatherOneCall>());
    });
  });

  group('$GeocodingService.getLocationByCityName', () {
    test('places is not empty', () async {
      final places = await gService.getLocationByCityName('Moscow');

      expect(places, isNotEmpty);
    });

    test('has limit 3', () async {
      final places = await gService.getLocationByCityName(
        'Moscow',
        limit: 3,
      );

      expect(places, hasLength(3));
    });
  });

  group('$GeocodingService.getLocationByCoordinates', () {
    test('places is not empty', () async {
      final places = await gService.getLocationByCoordinates(
        latitude: 55.752004,
        longitude: 37.617734,
      );

      expect(places, isNotEmpty);
      expect(places.first.latitude!.truncate(), 55);
      expect(places.first.longitude!.truncate(), 37);
    });
  });
}
