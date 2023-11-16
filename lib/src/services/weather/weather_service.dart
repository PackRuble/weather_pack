import 'package:meta/meta.dart';

import '../../api/api.dart';
import '../../utils/languages.dart';
import '../checks.dart';
import '../ovm_builder.dart';
import 'all_weather_model.dart';

enum WeatherUnits {
  standard,
  metric,
  imperial,
}

/// Service for fetching weather data in JSON.
class WeatherService {
  WeatherService(
    String api, {
    WeatherLanguage? language,
    WeatherUnits? units,
    @visibleForTesting OWMBuilder? owmBuilder,
  })  : _owmApi = OWMApi(api, language: language ?? WeatherLanguage.english, units: units ?? WeatherUnits.standard),
        _owmBuilder = owmBuilder ?? OWMBuilder();

  final OWMApi _owmApi;
  final OWMBuilder _owmBuilder;

  /// Fetch [WeatherOneCall] based on geographical coordinates.
  ///
  /// Result is JSON.
  /// For API documentation, see: [WeatherOnecall](https://openweathermap.org/api/one-call-api)
  Future<WeatherOneCall> oneCallWeatherByLocation({
    required double latitude,
    required double longitude,
  }) async {
    checkCoordinates(latitude, longitude);
    return _owmBuilder.getData(
      uri: _owmApi.uriOnecallWeather(latitude, longitude),
      builder: (dynamic data) {
        return WeatherOneCall.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  /// Fetch [WeatherCurrent] based on geographical coordinates.
  ///
  /// Result is JSON.
  /// For API documentation, see: [WeatherCurrent](https://openweathermap.org/current)
  Future<WeatherCurrent> currentWeatherByLocation({
    required double latitude,
    required double longitude,
  }) async {
    checkCoordinates(latitude, longitude);
    return _owmBuilder.getData(
      uri: _owmApi.uriCurrentWeather(latitude, longitude),
      builder: (dynamic data) {
        return WeatherCurrent.fromJson(
          parseCurrent(data as Map<String, dynamic>),
        );
      },
    );
  }

// todo: the ability to get the weather by the name of the place - built-in geocoding
//  we take the first location - it is usually the most accurate
}
