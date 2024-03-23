import 'base_api.dart';

enum OneCallApi {
  api_2_5('2.5'),
  api_3_0('3.0'),
  ;

  const OneCallApi(this._version);

  final String _version;
}

final class OneCallWeatherApi extends WeatherApi with WeatherParams {
  const OneCallWeatherApi(
    super._apiKey, {
    required super.language,
    required OneCallApi oneCallApi,
  }) : _oneCallApi = oneCallApi;

  final OneCallApi _oneCallApi;

  String get _apiPathOneCallWeather => 'data/${_oneCallApi._version}';

  static const _oneCallWeatherEndpoint = 'onecall';

  Uri uriOneCallWeather(double latitude, double longitude) => buildUri(
        path: _apiPathOneCallWeather,
        endpoint: _oneCallWeatherEndpoint,
        queryParams: queryParametersWeather(latitude, longitude),
      );
}
