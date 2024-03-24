import 'base_api.dart';

enum OneCallApi {
  api_2_5('2.5'),
  api_3_0('3.0'),
  ;

  const OneCallApi(this.version);

  final String version;
}

final class OneCallWeatherApi extends WeatherApi with WeatherParams {
  const OneCallWeatherApi(
    super._apiKey, {
    required super.language,
    required OneCallApi oneCallApi,
  }) : _oneCallApi = oneCallApi;

  final OneCallApi _oneCallApi;

  String get _apiPath => 'data/${_oneCallApi.version}';

  static const _endpoint = 'onecall';

  Uri uriOneCallWeather(double latitude, double longitude) => buildUri(
        path: _apiPath,
        endpoint: _endpoint,
        queryParams: queryParametersWeather(latitude, longitude),
      );
}
