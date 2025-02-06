import 'package:http/http.dart' as http;

import 'api_exception.dart';
import 'base_api.dart';
import 'onecall_api.dart';

/// A class to help check your APIkey.
final class OWMTestService extends BaseOWMApi {
  OWMTestService(super.apikey, [http.Client? client])
      : _client = client ?? http.Client();

  final http.Client _client;

  static const int _statusOkTestApi = 400;

  /// Check for a valid APIkey OWM.
  Future<bool> _isCorrectApiKey({
    required String path,
    required String endpoint,
  }) async {
    final Uri uri = buildUri(
      path: path,
      endpoint: endpoint,
    );

    try {
      final http.Response response = await _client.get(uri);

      return response.statusCode == _statusOkTestApi;
    } catch (error) {
      throw OwmApiException.error(error);
    }
  }

  Future<bool> isValidApikeyForOneCall(OneCallApi oneCallApi) async =>
      _isCorrectApiKey(
        endpoint: 'onecall',
        path: 'data/${oneCallApi.version}',
      );

  Future<bool> isValidApikey() async => _isCorrectApiKey(
        path: 'data/2.5',
        endpoint: 'current',
      );
}
