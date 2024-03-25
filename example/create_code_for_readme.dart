import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:weather_pack/weather_pack.dart';

// ignore_for_file: type=lint, dead_code, unused_local_variable

main() async {
  if (false) worksGeocodeService();
  if (false) getWeatherEasyWay();
  if (false) getOnecallWeatherWays();
  if (false) printAllSupportedLanguages();
  if (false) worksTempUnits();
  if (false) testAPIkey();
}

void worksGeocodeService({
  String api = 'your_apikey',
}) async {
  final gService = GeocodingService(api);

  final List<PlaceGeocode> places = await gService.getLocationByCoordinates(
      latitude: 52.374, longitude: 4.88969);

  print(places);
}

Future<void> getWeatherEasyWay({
  String api = 'your_apikey',
  WeatherLanguage lang = WeatherLanguage.italian,
}) async {
  final wService = WeatherService(api, language: lang);

  final WeatherCurrent current = await wService.currentWeatherByLocation(
      latitude: 52.374, longitude: 4.88969);

  final WeatherOneCall onecall = await wService.oneCallWeatherByLocation(
      latitude: 52.374, longitude: 4.88969);

  print(current);
  print(onecall);
}

Future<void> getOnecallWeatherWays({String api = 'Your_APIkey'}) async {
  final wService2_5 = WeatherService(api, oneCallApi: OneCallApi.api_2_5);

  final WeatherOneCall onecall2_5 = await wService2_5.oneCallWeatherByLocation(
      latitude: 52.374, longitude: 4.88969);

  print(onecall2_5);

  // if you use the "One Call API 3.0" subscription that...

  final wService3_0 = WeatherService(api, oneCallApi: OneCallApi.api_3_0);

  final WeatherOneCall onecall3_0 = await wService3_0.oneCallWeatherByLocation(
      latitude: 52.374, longitude: 4.88969);

  print(onecall3_0);
}

void printAllSupportedLanguages() {
  WeatherLanguage.values
      .forEach((lang) => print('${lang.index}. ${lang.name}'));
}

void worksTempUnits({
  double temp = 270.78, // received from [WeatherCurrent.temp]
  int precision = 3,
  Temp unitsMeasure = Temp.celsius,
}) {
  // The default temperature is measured in Kelvin of the `double` type.
  // We need the temperature to be displayed in Celsius to 3 decimal places

  print(unitsMeasure.value(temp, precision)); // `-2.37` type `double`
  print(unitsMeasure.valueToString(temp, precision)); // `-2.370` type `String`

  // if precision is 0:
  print(unitsMeasure.value(temp, 0)); // `-2.0` type `double`
  print(unitsMeasure.valueToString(temp, 0)); // `-2` type `String`
}

/// If the apikey is valid, `OWMApiTest` methods will return `true`
Future<void> testAPIkey({
  String testedAPIkey = 'your_apikey',
}) async {
  // checking key for geocoding service and for (fetching WeatherCurrent)
  final bool isValid = await OWMTestService(testedAPIkey).isValidApikey();

  // checking key for "One Call API 2.5" service (fetching WeatherOneCall)
  final bool isValidOneCall2 = await OWMTestService(testedAPIkey)
      .isValidApikeyForOneCall(OneCallApi.api_2_5);

  // or
  // checking key for "One Call by Call 3.0" service (fetching WeatherOneCall)
  final bool isValidOneCall3 = await OWMTestService(testedAPIkey)
      .isValidApikeyForOneCall(OneCallApi.api_3_0);
}

// -----------------------------------------------------------------------------

/// Easier to implement.
class OWMBuilderCustom extends OWMBuilder {
  /// We output the url to the console for debugging
  @override
  Future<T> getData<T>(
      {required Uri uri, required T Function(dynamic data) builder}) {
    print(uri);
    return super.getData(uri: uri, builder: builder);
  }
}

void workOwmBuilder({
  String api = 'your_apikey',
}) async {
  final customOWMBuilder = OWMBuilderCustom();
  final gService = GeocodingService(api, owmBuilder: customOWMBuilder);

  final List<PlaceGeocode> places = await gService.getLocationByCoordinates(
      latitude: 52.374, longitude: 4.88969);

  print(places);
}

// -----------------------------------------------------------------------------

/// A more low-level way, would require an explicit dependency on the `http` package
///
class CustomClient extends IOClient {
  /// We output the url to the console for debugging
  @override
  Future<Response> get(Uri url, {Map<String, String>? headers}) {
    print(url);
    return super.get(url, headers: headers);
  }
}

/// We output the url to the console for debugging
void workCustomClient({
  String api = 'your_apikey',
}) async {
  final customClient = CustomClient();
  final testService = OWMTestService(api, customClient);

  final bool isValidKey = await testService.isValidApikey();

  print(isValidKey);
}

// -----------------------------------------------------------------------------

void exceptionHandling() async {
  final wService = WeatherService('bRoKen_aPi');

  WeatherCurrent? current;
  try {
    current =
        await wService.currentWeatherByLocation(latitude: 1, longitude: 1);
  } on OwmApiException catch (e, s) {
    print(e.code);
    print(e.message);
    print(s);
  }
}
