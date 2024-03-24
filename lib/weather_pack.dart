// Copyright (c) 2022-2024 Ruble Pack
//
// Use of this source code is governed by the license found in the LICENSE file.

/// The project is designed to obtain weather via the OpenWeatherMap API.
///
/// With handy features. :)
library weather_pack;

// ignore_for_file: directives_ordering

// api
export 'src/api/api_exception.dart' show OwmApiException;
export 'src/api/onecall_api.dart' show OneCallApi;
export 'src/api/test_api.dart' show OWMTestService;
// geocoding service
export 'src/services/geocoding/geocoding_service.dart' show GeocodingService;
export 'src/services/geocoding/place_geocode_model.dart' show PlaceGeocode;
export 'src/services/ovm_builder.dart' show OWMBuilder;
// weather service
export 'src/services/weather/all_weather_model.dart'
    show
        WeatherAlert,
        WeatherCurrent,
        WeatherDaily,
        WeatherHourly,
        WeatherMinutely,
        WeatherOneCall;
export 'src/services/weather/weather_service.dart' show WeatherService;
export 'src/utils/image_paths.dart' show ImagePathWeather;
export 'src/utils/languages.dart' show WeatherLanguage, codeAndLangMatching;
// others helpers
export 'src/utils/units_measure.dart'
    show Pressure, SideOfTheWorld, Speed, Temp, UnitValue;
