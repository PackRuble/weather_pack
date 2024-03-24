import 'dart:io';

Future<List<String>> get oneCallData async =>
    [for (final path in _oneCallDataPaths) await File(path).readAsString()];

const List<String> _oneCallDataPaths = [
  'test/source/onecall_api_2_5/one_call_16.02.22.json',
  'test/source/onecall_api_2_5/one_call_17.10.22.json',
  'test/source/onecall_api_3_0/one_call_23.03.24.json',
  // add here when will need
];

Future<List<String>> get weatherCurrentData async => [
      for (final path in _weatherCurrentDataPaths)
        await File(path).readAsString(),
    ];

const List<String> _weatherCurrentDataPaths = [
  'test/source/current_16.02.22.json',
  // add here when will need
];
