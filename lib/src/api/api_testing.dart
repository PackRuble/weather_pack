import 'package:http/http.dart' as http;

import 'api.dart';

/// A class to help check your APIkey.
class OWMApiTest {
  // ignore: public_member_api_docs
  OWMApiTest([http.Client? client]) : _client = client ?? http.Client();

  final http.Client _client;

  static const int _statusOkTestApi = 400;

  /// Check for a valid APIkey OWM.
  Future<bool> isCorrectApiKey(String yourApi) async {
    final Uri uri = OWMApi.uriTestApikey(yourApi);

    final http.Response response = await _client.get(uri);

    if (response.statusCode == _statusOkTestApi) {
      return true;
    }

    return false;
  }
}
