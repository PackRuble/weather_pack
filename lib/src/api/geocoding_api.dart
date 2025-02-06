import 'base_api.dart';

final class GeocodingApi extends BaseOWMApi {
  const GeocodingApi(super._apiKey);

  static const String _apiPathGeocoding = 'geo/1.0';
  static const String _directGeocodingEndpoint = 'direct';
  static const String _zipGeocodingEndpoint = 'zip';
  static const String _reverseGeocodingEndpoint = 'reverse';

  Uri uriLocationByCityName(String cityName, {int limit = 5}) => buildUri(
        path: _apiPathGeocoding,
        endpoint: _directGeocodingEndpoint,
        queryParams: _queryParamsDirectGeocoding(cityName, limit),
      );

  Uri uriLocationByCoordinates(double lat, double lon, {int limit = 5}) =>
      buildUri(
        path: _apiPathGeocoding,
        endpoint: _reverseGeocodingEndpoint,
        queryParams: _queryParamsReverseGeocoding(lat, lon, limit),
      );

  Uri uriLocationByZip({
    required String zipCode,
    required String countryCode,
  }) =>
      buildUri(
        path: _apiPathGeocoding,
        endpoint: _zipGeocodingEndpoint,
        queryParams: _queryParamsZipGeocoding(zipCode, countryCode),
      );

  Map<String, String> _queryParamsDirectGeocoding(
    String cityName,
    int limit,
  ) =>
      {'q': cityName, ..._queryParams(limit)};

  Map<String, String> _queryParamsReverseGeocoding(
    double lat,
    double lon,
    int limit,
  ) =>
      {'lat': lat.toString(), 'lon': lon.toString(), ..._queryParams(limit)};

  Map<String, String> _queryParamsZipGeocoding(
    String zipCode,
    String countryCode,
  ) =>
      {'zip': '$zipCode,$countryCode', ..._queryParams(null)};

  /// -> param:
  /// * limit: Number of the locations in the API response (no more than 5)
  Map<String, String> _queryParams(int? limit) => {
        if (limit != null) 'limit': '$limit',
      };
}
