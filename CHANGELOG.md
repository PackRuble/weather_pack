[//]: # (## [1.1.0] - 01-01-2024)

[//]: # ()
[//]: # (-)

## [1.1.0] - 25-03-2024

- actualizing code documentation according to new information in "One Call Api 3.0"
- add: new parameter `OneCallApi` in `WeatherService` to be able to select the API endpoint for OCA
- add: `WeatherDaily.summary` for OCA 3.0
- fix: `OWMBuilder` parameter in `WeatherService` and `GeocodingService` is now visible in the package API.
- 🧨add: use `OWMTestService(testedKey).isValidApikeyForOneCall` and `OWMTestService(testedKey).isValidApikey` instead of `OWMApiTest().isCorrectApiKey(testedKey)`
- doc: sections "Exception handling", "Usage custom client" in readme
- internal: remove `meta` from dependencies
- internal: split `OWMApi` into parts: `GeocodingApi`, `CurrentWeatherApi`, `OneCallWeatherApi`
- internal: use `show` way instead of `hide` to control the package API
- internal: tests for `WeatherService` and `GeocodingService`

## [1.0.1] - 19-11-2023

- fix: limit when get location in GeocodingService (thanks svoza10 for [#7](https://github.com/PackRuble/weather_pack/pull/7))
- upd: improving changelog according to some excerpts from keepachangelog.com

## [1.0.0] - 28-07-2023

- bump dependencies. Now we use dart 3.0

## [0.1.0] - 28-07-2023

- fix [issue #1](https://github.com/PackRuble/weather_pack/issues/1) of hiding `parseCurrent` from public api
- add assert for latitude and longitude
- `WeatherService` and `GeocodingService`, and `OWMApiTest` now accept `client` as a parameter. This can be handy when testing
- bump dependencies. The next release will be an upgrade to Dart 3.0

## [0.0.2] - 27-12-2022

- fix [issue #5](https://github.com/PackRuble/weather_pack/issues/5) when some boundary cases were not taken into account
- add to the "example" folder console application. A detailed analysis of code writing will be provided later
- add visual resources to documentation, styling of the package was adjusted, link to telegram [channel](https://t.me/+AkGV73kZi_Q1YTMy) is attached

## [0.0.1] - 21-10-2022

Initial development release. Hi pub.dev