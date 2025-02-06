<a href="https://github.com/PackRuble/weather_pack/"><img src="https://github.com/PackRuble/weather_pack/blob/master/assets/images/banner.png?raw=true"/></a>


## weather_pack

[![telegram_badge]][telegram_link]
[![pub_badge]][pub_link]
[![repo_star_badge]][repo_link]]
[![mit_license_badge]][mit_license]
[![code_size_badge]][repo_link]]

A quick way to get access to weather conditions 🌦.

> Put a ![][pub_like_icon] on [Pub][pub_link] and favorite ⭐ on [Github][repo_link] to keep up with changes and not miss new releases!

**Why choose this library?**

**_basic:_**
1. 🚲 Easy to use - you only need the APIKEY.
2. 🏝 Built-in geocoding - search for locations by assumed names or by coordinates.
3. 🩺 Various units of measurement - speed, temperature, pressure and cardinal points.
4. 🌤 There are original weather icons.

<details> <summary> <b><i>advanced:</i></b> (Click to open)</summary>
<ol>
<li>🔮 At least one release application is already based on this package. Therefore, there is an 
additional guarantee of security and timely updates of this package.</li>
<li>🔓 There is a method for checking your api for correctness.</li>
<li>🧱 It is very easy to customize data models. Create your own data models and take only what 
you need from the built-in ones.</li>
<li>🧾 The code is well documented and each class is labeled and decoded. There are unit tests 
for the main functions of the package.</li>
<li>🦺 Safe unpacking of types. If the server stops outputting values - your weather model 
will have a null field and the application will not crash.</li>
<li>🔧 This package has no unnecessary dependencies and contains minimal code. 
Also, all platforms are supported.</li>
</ol>
</details>


## Endpoints openweathermap.org

Let's agree to designate _Openweathermap_ as _**OWM**_.

The library uses the following site endpoints [openweathermap.org](https://openweathermap.org/):

| api.openweathermap.org<br/>{/path/endpoint} | A {Class.method} that uses this endpoint          | See more               |
|---------------------------------------------|---------------------------------------------------|------------------------|
| /data/2.5/weather                           | `WeatherService.currentWeatherByLocation`         | [current]              |
| /data/2.5/onecall                           | `WeatherService.oneCallWeatherByLocation`         | [one-call-api]         |
| /data/3.0/onecall                           | `WeatherService.oneCallWeatherByLocation`         | [one-call-3]           |
| /geo/1.0/direct                             | `GeocodingService.getLocationByCityName`          | [geocoding-direct]     |
| /geo/1.0/reverse                            | `GeocodingService.getLocationByCoordinates`       | [geocoding-reverse]    |
| /geo/1.0/zip                                | `GeocodingService.getLocationByZipAndCountryCode` | [geocoding-direct_zip] |

<!-- Links -->
[current]: https://openweathermap.org/current
[one-call-api]: https://openweathermap.org/api/one-call-api
[one-call-3]: https://openweathermap.org/api/one-call-3
[geocoding-direct]: https://openweathermap.org/api/geocoding-api#direct
[geocoding-direct_zip]: https://openweathermap.org/api/geocoding-api#direct_zip
[geocoding-reverse]: https://openweathermap.org/api/geocoding-api#reverse


## Table of Contents
<!-- TOC -->
  * [weather_pack](#weather_pack)
  * [Endpoints openweathermap.org](#endpoints-openweathermaporg)
  * [Table of Contents](#table-of-contents)
  * [Installing](#installing)
  * [Getting Started](#getting-started)
  * [Usage weather service](#usage-weather-service)
  * [Usage geocoding service](#usage-geocoding-service)
  * [Usage units measure](#usage-units-measure)
  * [Exception handling](#exception-handling)
  * [Usage custom client](#usage-custom-client)
  * [Usage weather icons](#usage-weather-icons)
  * [API key testing](#api-key-testing)
  * [Resources](#resources)
  * [Author](#author)
  * [Support](#support)
<!-- TOC -->


## Installing

1. Add dependency to your `pubspec.yaml`:
   ```yaml
   dependencies:
     weather_pack: ^<latest_version>
    ```
2. Run the command: `flutter pub get`
3. Use in your code:
   ```dart
   import 'package:weather_pack/weather_pack.dart';
   ```
4. \*Additionally, pull package locally to examine `example` folder:
   ```shell
   flutter pub unpack
    ```
   - `weather_in_console` - Dart console application
   - `create_code_for_readme` - all examples from current manual
   - `example` - easy use

## Getting Started

The easiest way to get the current weather:
```dart
Future<void> main() async {
  const api = 'YOUR_APIKEY'; // TODO: change to your openweathermap APIkey
  final wService = WeatherService(api);

  // get the current weather in Amsterdam
  final WeatherCurrent currently = await wService.currentWeatherByLocation(
      latitude: 52.374, longitude: 4.88969);
  
  print(currently);
}
```

You can also change the request language:
```dart
final lang = WeatherLanguage.arabic;

final wService = WeatherService(api, language: lang);
```

<details> <summary> <b><i>Supported languages:</i></b> (Click to open)</summary>

1. Afrikaans
2. Albanian
3. Arabic
4. Azerbaijani
5. Bulgarian
6. Catalan
7. Czech
8. Danish
9. German
10. Greek
11. English
12. Basque
13. Persian
14. Farsi
15. Finnish
16. French
17. Galician
18. Hebrew
19. Hindi
20. Croatian
21. Hungarian
22. Indonesian
23. Italian
24. Japanese
25. Korean
26. Latvian
27. Latvian
28. Macedonian
29. Norwegian
30. Dutch
31. Polish
32. Portuguese
33. Português Brasil
34. Romanian
35. Russian
36. Swedish
37. Slovak
38. Slovenian
39. Spanish
40. Serbian
41. Thai
42. Turkish
43. Ukrainian
44. Vietnamese
45. Chinese Simplified
46. Chinese Traditional
47. Zulu

</details>

According to OWM service ([See more](https://openweathermap.org/current#multi)):
> You can use the `lang` parameter to get the output in your language.
> 
> Translation is applied for the `city name` and `description` fields.


## Usage weather service

Now there are two weather models - `WeatherCurrent` and `WeatherOneCall`.

`WeatherOneCall` includes:
1. `WeatherCurrent`
2. `List<WeatherHourly>`
3. `List<WeatherMinutely>`
4. `List<WeatherDaily>`
5. `List<WeatherAlert>`

**How to use?**

You can get the weather in the following way:

```dart
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
```

**_Why do you only use the weather search by coordinates?_**

According to the website OWM:
> Please use Geocoder API if you need automatic convert city names and zip-codes to geo 
> coordinates and the other way around.
> 
> Please note that built-in geocoder has been deprecated. Although it is still available for use, 
> bug fixing and updates are no longer available for this functionality.


## Usage geocoding service

`GeocodingService` is a service for easy location search when working with geographical names
and coordinates. Supports both the direct and reverse methods:
- Direct geocoding converts the specified name of a location or zip/post code into
  the exact geographical coordinates;
- Reverse geocoding converts the geographical coordinates into the names of the nearby locations;

You can find out more at this link: [Geocoding API OpenWeather](https://openweathermap.org/api/geocoding-api)

**How to use?**

Create `GeocodingService` in the following way:
```dart
final String cityName = 'suggested location name';
final String apiKey = 'your api key for OWM';

final GeocodingService gService = GeocodingService(apiKey);
```

To find using place names use direct geocoding:
```dart
final List<PlaceGeocode> places = await gService.getLocationByCityName(cityName);
```

or use reverse geocoding:
```dart
final List<PlaceGeocode> places = await gService.getLocationByCoordinates(
    latitude: 52.374, longitude: 4.88969);
```

To find using country code and zip code use zip geocoding:
```dart
final PlaceGeocode place = await gService.getLocationByZipAndCountryCode(
  zipCode: 'E14',
  countryCode: 'GB',
);
```


## Usage units measure

By default, all weather models, e.g. `WeatherCurrent`, have measurable values of type `double`.
To display the data in a convenient format, it is necessary use the conversion method `value`
or `valueToString`:
```dart
void worksTempUnits({
  double temp = 270.78, // ex. received from [WeatherCurrent.temp]
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
```

_By and large, the `valueToString()` method is needed to display correctly in ui,
and the `value()` method is for accurate calculations._

There are several units of measurement:

| Units of measure | Class            | Supported units                     | Conversion |
|------------------|------------------|-------------------------------------|------------|
| Temperature      | `Temp`           | kelvin, celsius, fahrenheit         | +          |
| Speed            | `Speed`          | ms, mph, kph                        | +          |
| Pressure         | `Pressure`       | hectoPa, mbar, mmHg, kPa, atm, inHg | +          |
| Cardinal points  | `SideOfTheWorld` | n, ne, e, se, s, sw, w, nw          | +(another) |

💡 **Tip**: The `SideOfTheWorld` enum contains a static method `fromDegrees()` for converting degrees
to cardinal directions.


## Exception handling

Each of the methods in the `WeatherService` and `GeocodingService` services can throw an `OwmApiException` exception. You can process them as follows:

```dart
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
```


## Usage custom client

For `GeocodingService` and `WeatherService` you can create a custom `OWMBuilder` for debugging and logging cases:

```dart
class OWMBuilderCustom extends OWMBuilder {
  /// We output the url to the console for debugging and logging
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
```

For `OWMTestService` you can create a custom `Client`. A more low-level way, would require an explicit dependency on the `http` package:

```dart
class CustomClient extends IOClient {
  /// We output the url to the console
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
```

## Usage weather icons

You can use weather icons provided by the OWM service. See more about [weather conditions](https://openweathermap.org/weather-conditions).

Icons are stored locally in this package at the path `assets/weather_icons/`. 
They are ordered according to [Declaring resolution-aware image assets](https://docs.flutter.dev/development/ui/assets-and-images#resolution-aware).
This reflects the following correspondences:

```text
100*100 - in default(implied resolution @1)
200x200 - @2
300x300 - @3
400x400 - @4
```

with the preservation of image quality.

**How to use?**

Get the weather icon in a safe way:
```dart
Image getWeatherIcon(String weatherIcon) {
  return Image.asset(
    ImagePathWeather.getPathWeatherIcon(weatherIcon),
    filterQuality: FilterQuality.high, // optional
    package: ImagePathWeather.packageName,
  );
}
```

or to process it completely by hand:
```dart
Widget getWeatherIcon(WeatherCurrent weather) {
  return Image.asset(
    'assets/weather_icons/${weather.weatherIcon}.png', // icon path
    package: 'weather_pack', // name package
    filterQuality: FilterQuality.high, // optional
    errorBuilder: (c, e, s) => Text(e), // will return the widget in case of an error
  );
}
```

In this case, you can use the best quality regardless of platform resolution by specifying `@4` to path:
```text
'assets/weather_icons/@4/$weatherIcon.png'
```

## API key testing

It is possible to test the API key. 
To do this, the `OWMTestService` class has a method `isValidApikeyForOneCall`:
```dart
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
```

## Resources

- folder [`example`](https://github.com/PackRuble/weather_pack/tree/master/example).
  There is a simple example of how to use the basic functions of the package, as well as a console mini-application without using flutter
    - [![habr_badge]][habr_link] [Как создать консольное приложение на языке dart, используя пакет weather_pack?][habr_link]
    - [![medium_badge]][medium_link] [How to create a console application in dart using the weather_pack package?][medium_link]

<!-- Links -->

[habr_badge]: https://img.shields.io/badge/habr-RU-F9DFCF?style=plastic&logo=habr
[habr_link]: https://habr.com/ru/post/708854/
[medium_badge]: https://img.shields.io/badge/medium-EN-C8A2C8?style=plastic&logo=medium
[medium_link]: https://medium.com/@pack.ruble/how-to-create-a-console-application-in-dart-using-the-weather-pack-package-68ed814f1903

![](example/weather_in_console/assets/result_in_console.gif)

Feel free to suggest materials for inclusion in this list ^_~


## Author

You can contact me or check out my activities on the following platforms:

- [Github](https://github.com/PackRuble)
- [Telegram Group](https://t.me/+AkGV73kZi_Q1YTMy)
- [StackOverflow](https://stackoverflow.com/users/17991131/ruble)
- [Medium](https://medium.com/@pack.ruble)
- [Habr](https://habr.com/ru/users/PackRuble/)

> Made with ❤️. Enjoy it!

## Support

Feel free to contribute to this project.

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an [issue][issue].  

If you fixed a bug or implemented a feature, please send a [pull request][pr]. Use `dev` branch for this.

---

<h6>
🏷 tags: weather, openWeather, openweathermap, weather forecast, metcast, W/F, reverse/direct geocoding, units measure, temperature, pressure, speed 
</h6>

<!-- Links -->

[mit_license_badge]: https://img.shields.io/badge/license-MIT-green?style=plastic
[mit_license]: https://github.com/PackRuble/weather_pack/blob/master/LICENSE
[code_size_badge]: https://img.shields.io/github/languages/code-size/PackRuble/weather_pack?style=plastic
[repo_star_badge]: https://img.shields.io/github/stars/PackRuble/weather_pack?style=plastic
[repo_link]: https://github.com/PackRuble/weather_pack
[pub_badge]: https://img.shields.io/pub/v/weather_pack.svg?style=plastic&color=orange
[pub_link]: https://pub.dev/packages/weather_pack
[pub_like_icon]: https://pub.dev/static/hash-ffjootqp/img/like-active.svg
[buy_me_a_coffee]: https://www.buymeacoffee.com/<>
[issue]: https://github.com/PackRuble/weather_pack/issues
[pr]: https://github.com/PackRuble/weather_pack/pulls
[telegram_badge]: https://img.shields.io/badge/telegram-❤️-33cccc?style=plastic&logo=telegram
[telegram_link]: https://t.me/+AkGV73kZi_Q1YTMy