sealed class AppException implements Exception {
  const AppException(this.message);

  final String message;


  @override
  String toString() => '$runtimeType: $message';
}

class NetworkException extends AppException {
  const NetworkException([super.message = 'Check your internet connection.']);
}

class ServerException extends AppException {
  const ServerException(super.message, {this.statusCode});

  final int? statusCode;
}

class ParsingException extends AppException {
  const ParsingException([super.message = 'Unexpected response format.']);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException([super.message = 'Your session has expired. Please log in again.']);
}