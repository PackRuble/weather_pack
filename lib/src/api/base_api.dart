import '../utils/languages.dart';

/// Uri builder class for the OpenWeatherMap(OWM) API.
abstract base class BaseOWMApi {
  const BaseOWMApi(this._apiKey);

  final String _apiKey;

  static const String schemeUrl = 'https';
  static const String apiBaseUrl = 'api.openweathermap.org';

  /// [_schemeUrl]://[apiBaseUrl]/[path]/[endpoint]?[queryParams]
  ///
  /// Examples:
  ///
  /// https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
  ///
  /// https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&exclude={part}&appid={API key}
  /// https://api.openweathermap.org/data/3.0/onecall?lat=33.44&lon=-94.04&exclude=hourly,daily&appid={API key}
  ///
  /// http://api.openweathermap.org/geo/1.0/direct?q={city name},{state code},{country code}&limit={limit}&appid={API key}
  /// http://api.openweathermap.org/geo/1.0/reverse?lat={lat}&lon={lon}&limit={limit}&appid={API key}
  ///
  Uri buildUri({
    required String path,
    required String endpoint,
    Map<String, String>? queryParams,
  }) =>
      Uri(
        scheme: schemeUrl,
        host: apiBaseUrl,
        path: '$path/$endpoint',
        //  type `queryParameters` only is /*String|Iterable<String>*/
        queryParameters: {...?queryParams, 'appid': _apiKey},
      );
}

abstract base class WeatherApi extends BaseOWMApi {
  const WeatherApi(
    super._apiKey, {
    required WeatherLanguage language,
  }) : _language = language;

  final WeatherLanguage _language;
}

base mixin WeatherParams on WeatherApi {
  Map<String, String> queryParametersWeather(double lat, double lon) => {
        'lat': lat.toString(),
        'lon': lon.toString(),
        'lang': _language.code,
        'units': 'standard',
      };
}
