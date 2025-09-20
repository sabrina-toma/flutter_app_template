import 'package:dio/dio.dart';
import 'api_error.dart';

class HandleError {
  HandleError._();

  static ApiError mapStatusCodeToError(int? statusCode) {
    switch (statusCode) {
      case 204:
        return NoContentError();

      case 400:
        return BadRequestError();

      case 401:
        return UnauthorizedError();

      case 403:
        return ForbiddenError();

      case 404:
        return NotFoundError();

      case 408:
        return RequestTimeoutError();  // HTTP 408 Request Timeout

      case 409:
        return ConflictError();  // HTTP 409 Conflict

      case 422:
        return UnprocessableEntityError();  // HTTP 422 Unprocessable Entity

      case 500:
        return InternalServerError();

      case 503:
        return ServiceUnavailableError();  // HTTP 503 Service Unavailable

      default:
        return UnknownApiError(statusCode);
    }
  }

  static ApiError mapDioExceptionToError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ConnectTimeoutError();

      case DioExceptionType.sendTimeout:
        return SendTimeoutError();

      case DioExceptionType.receiveTimeout:
        return ReceiveTimeoutError();

      case DioExceptionType.badResponse:
        return mapStatusCodeToError(e.response?.statusCode);

      case DioExceptionType.cancel:
        return CancelError();

      case DioExceptionType.connectionError:
        return NetworkError(message: "No internet connection.");

      case DioExceptionType.badCertificate:
        return BadCertificateError();  // Handles SSL errors

      default:
        return UnknownApiError(e.response?.statusCode, message: 'An unknown Dio error occurred.');
    }
  }
}
