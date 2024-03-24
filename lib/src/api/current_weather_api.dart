import 'base_api.dart';

final class CurrentWeatherApi extends WeatherApi with WeatherParams {
  const CurrentWeatherApi(super._apiKey, {required super.language});

  static const _apiPath = 'data/2.5';
  static const _endpoint = 'weather';

  Uri uriCurrentWeather(double latitude, double longitude) => buildUri(
        path: _apiPath,
        endpoint: _endpoint,
        queryParams: queryParametersWeather(latitude, longitude),
      );
}
