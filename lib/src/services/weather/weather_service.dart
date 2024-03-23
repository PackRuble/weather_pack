import 'package:weather_pack/src/api/current_weather_api.dart';

import '../../api/onecall_api.dart';
import '../../utils/languages.dart';
import '../checks.dart';
import '../ovm_builder.dart';
import 'all_weather_model.dart';

/// Service for fetching weather data:
/// - [WeatherOneCall]
/// - [WeatherCurrent]
class WeatherService {
  WeatherService(
    String apikey, {
    WeatherLanguage language = WeatherLanguage.english,

    /// The new api key may not fit One Call Api 2.5 and OVER.
    ///
    /// If you have previously used the One Call Api 2.5 key and service, use [OneCallApi.api_2_5]
    /// Link: https://openweathermap.org/api/one-call-api
    ///
    /// If you use the "One Call by Call" subscription and One Call API 3.0, then use [OneCallApi.api_3_0]
    /// Link: https://openweathermap.org/api/one-call-3
    ///
    /// This does not in any way affect the use of the "Current weather data" API.
    /// Link: https://openweathermap.org/current
    OneCallApi oneCallApi = OneCallApi.api_2_5,
    OWMBuilder? owmBuilder,
  })  : _currentWeatherApi = CurrentWeatherApi(apikey, language: language),
        _oneCallWeatherApi = OneCallWeatherApi(apikey,
            language: language, oneCallApi: oneCallApi),
        _owmBuilder = owmBuilder ?? OWMBuilder();

  final CurrentWeatherApi _currentWeatherApi;
  final OneCallWeatherApi _oneCallWeatherApi;
  final OWMBuilder _owmBuilder;

  /// Fetch [WeatherOneCall] based on geographical coordinates.
  ///
  /// For API documentation, see: [WeatherOnecall](https://openweathermap.org/api/one-call-api)
  Future<WeatherOneCall> oneCallWeatherByLocation({
    required double latitude,
    required double longitude,
  }) async {
    checkCoordinates(latitude, longitude);
    return _owmBuilder.getData(
      uri: _oneCallWeatherApi.uriOneCallWeather(latitude, longitude),
      builder: (dynamic data) =>
          WeatherOneCall.fromJson(data as Map<String, dynamic>),
    );
  }

  /// Fetch [WeatherCurrent] based on geographical coordinates.
  ///
  /// For API documentation, see: [WeatherCurrent](https://openweathermap.org/current)
  Future<WeatherCurrent> currentWeatherByLocation({
    required double latitude,
    required double longitude,
  }) async {
    checkCoordinates(latitude, longitude);
    return _owmBuilder.getData(
      uri: _currentWeatherApi.uriCurrentWeather(latitude, longitude),
      builder: (dynamic data) => WeatherCurrent.fromJson(
        parseCurrent(data as Map<String, dynamic>),
      ),
    );
  }
}
