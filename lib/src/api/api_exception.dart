/// Custom Exception for the Open Weather.
///
/// Thrown whenever the API responds with an error and body could not be parsed.
class OwmApiException implements Exception {
  const OwmApiException(this.code, this.message);

  OwmApiException.error(Object? error)
      : message = '$error',
        code = 0;

  /// Message about error.
  final String message;

  /// Code api error.
  ///
  /// See more: [section API errors](https://openweathermap.org/faq)
  final int code;

  @override
  String toString() => '$OwmApiException(code: $code, message: $message)';
}
