## How do I get the current weather forecast?
The easiest way is shown below. You can find a full in `example` folder.
```dart
import 'package:weather_pack/weather_pack.dart';

Future<void> main() async {
  const api = 'YOUR_APIKEY'; // TODO: change to your Openweathermap APIkey
  final wService = WeatherService(api);

  // get the current weather in Amsterdam
  final WeatherCurrent currently = await wService.currentWeatherByLocation(
      latitude: 52.374, longitude: 4.88969);
  
  print(currently);
}
```


## How do I get a city by coordinates?

Using `GeocodingService` you can get the city by coordinates:

```dart
void main() async {
  const api = 'YOUR_APIKEY'; // TODO: change to your Openweathermap APIkey
  final gService = GeocodingService(api);

  final List<PlaceGeocode> places = await gService.getLocationByCoordinates(
      latitude: 52.374, longitude: 4.88969);

  print(places);
}
```
