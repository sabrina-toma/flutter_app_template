class ApiError {
  final String message;
  final int? statusCode;

  ApiError(this.message, [this.statusCode]);

  @override
  String toString() => '$message (Status Code: $statusCode)';
}

class NoContentError extends ApiError {
  NoContentError() : super('No content available', 204);
}

class BadRequestError extends ApiError {
  BadRequestError() : super('Bad request', 400);
}

class UnauthorizedError extends ApiError {
  UnauthorizedError() : super('Unauthorized request', 401);
}

class ForbiddenError extends ApiError {
  ForbiddenError() : super('Forbidden request', 403);
}

class NotFoundError extends ApiError {
  NotFoundError() : super('Not found', 404);
}

class RequestTimeoutError extends ApiError {
  RequestTimeoutError() : super('Request timeout', 408);
}

class ConflictError extends ApiError {
  ConflictError() : super('Conflict occurred', 409);
}

class UnprocessableEntityError extends ApiError {
  UnprocessableEntityError() : super('Unprocessable entity', 422);
}

class InternalServerError extends ApiError {
  InternalServerError() : super('Internal server error', 500);
}

class ServiceUnavailableError extends ApiError {
  ServiceUnavailableError() : super('Service unavailable', 503);
}

class ConnectTimeoutError extends ApiError {
  ConnectTimeoutError() : super('Connection timeout error');
}

class SendTimeoutError extends ApiError {
  SendTimeoutError() : super('Send timeout error');
}

class ReceiveTimeoutError extends ApiError {
  ReceiveTimeoutError() : super('Receive timeout error');
}

class CancelError extends ApiError {
  CancelError() : super('Request cancelled');
}

class NetworkError extends ApiError {
  NetworkError({String message = 'Network error'}) : super(message);
}

class BadCertificateError extends ApiError {
  BadCertificateError() : super('Bad certificate error');
}

class UnknownApiError extends ApiError {
  UnknownApiError(int? statusCode, {String message = 'An unknown error occurred'})
      : super(message, statusCode);
}

class FormatExceptionError extends ApiError {
  FormatExceptionError() : super('FormatException: Unexpected character in JSON');
}

class FirebaseAuthError extends ApiError {
  FirebaseAuthError(String? message) : super(message ?? 'Unknown error occurred from firebase');
}