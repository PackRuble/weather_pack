import 'base_api.dart';

final class CurrentWeatherApi extends WeatherApi with WeatherParams {
  const CurrentWeatherApi(super._apiKey, {required super.language});

  static const _apiPathCurrentWeather = 'data/2.5';
  static const _currentWeatherEndpoint = 'weather';

  Uri uriCurrentWeather(double latitude, double longitude) => buildUri(
        path: _apiPathCurrentWeather,
        endpoint: _currentWeatherEndpoint,
        queryParams: queryParametersWeather(latitude, longitude),
      );
}
