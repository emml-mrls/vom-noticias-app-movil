class ServerException implements Exception {
  final int statusCode;
  final String? body;
  const ServerException(this.statusCode, [this.body]);

  @override
  String toString() => 'ServerException($statusCode): $body';
}

class ParseException implements Exception {
  final String? details;
  const ParseException([this.details]);

  @override
  String toString() => 'ParseException: $details';
}

class NetworkException implements Exception {
  const NetworkException();

  @override
  String toString() => 'NetworkException';
}