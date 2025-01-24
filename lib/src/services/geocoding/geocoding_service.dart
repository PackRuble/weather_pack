import 'package:weather_pack/src/api/geocoding_api.dart';

import '../checks.dart';
import '../owm_builder.dart';
import 'place_geocode_model.dart';

/// The class provides access to the geocoding service of cities.
///
/// Supports both the direct and reverse methods:
/// * Direct geocoding converts the specified name of a location or zip/post code
/// into the exact geographical coordinates;
/// * Reverse geocoding converts the geographical coordinates into
/// the names of the nearby locations;
///
/// Learn more [geocoding-api](https://openweathermap.org/api/geocoding-api)
class GeocodingService {
  GeocodingService(
    String apikey, {
    OWMBuilder? owmBuilder,
  })  : _geocodingApi = GeocodingApi(apikey),
        _owmBuilder = owmBuilder ?? OWMBuilder();

  final GeocodingApi _geocodingApi;
  final OWMBuilder _owmBuilder;

  /// Get locations based on the approximate name of the location.
  ///
  /// params:
  /// * cityName -> city name on local language.
  /// * limit -> Number of the locations in the API response (no more than 5).
  Future<List<PlaceGeocode>> getLocationByCityName(
    String cityName, {
    int limit = 5,
  }) async =>
      _owmBuilder.getData(
        uri: _geocodingApi.uriLocationByCityName(cityName, limit: limit),
        builder: _castData,
      );

  /// Get locations by coordinates.
  ///
  /// params:
  /// * latitude -> Latitude of the weather observation.
  /// * longitude -> Longitude of the weather observation.
  /// * limit -> Number of the locations in the API response (no more than 5).
  Future<List<PlaceGeocode>> getLocationByCoordinates({
    required double latitude,
    required double longitude,
    int limit = 5,
  }) async {
    checkCoordinates(latitude, longitude);
    return _owmBuilder.getData(
      uri: _geocodingApi.uriLocationByCoordinates(
        latitude,
        longitude,
        limit: limit,
      ),
      builder: _castData,
    );
  }

  /// Get locations based on zip/post code and country code.
  ///
  /// This method fetches the geographical coordinates and corresponding
  /// location names for a specified zip/post code and country code.
  ///
  /// params:
  /// * zipCode -> The zip or postal code of the location.
  /// * countryCode -> The two-letter ISO 3166 country code (e.g., "US" for the United States).
  /// * limit -> Number of the locations in the API response (no more than 5, default is 5).
  ///
  /// Returns:
  /// A list of [PlaceGeocode] objects containing location information.
  Future<List<PlaceGeocode>> getLocationByZipAndCountryCode({
    required String zipCode,
    required String countryCode,
    int limit = 5,
  }) async {
    return _owmBuilder.getData(
      uri: _geocodingApi.uriLocationByZip(zipCode, countryCode, limit: limit),
      builder: _castData,
    );
  }

  List<PlaceGeocode> _castData(dynamic data) => [
        for (final place in data as List<dynamic>)
          PlaceGeocode.fromJson(place as Map<String, dynamic>),
      ];
}
