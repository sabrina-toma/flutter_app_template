import 'package:dio/dio.dart';

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  default_
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.default_.getFailure();
    }
  }
}

Failure _handleBadResponse(DioException error) {

  if (error.response?.statusCode == 401) {
    return Failure("Failure", "Invalid user name or password, please try again.");
  } else if (error.response?.statusCode == 400) {
    // return Failure("Failure", 'Incorrect current password.');
  }
  return DataSource.default_.getFailure();
}

Failure _handleError(DioException error) {
  switch (error.type) {
  // case DioExceptionType.connectionError:
  //   return DataSource.NO_INTERNET_CONNECTION.getFailure();

    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeout.getFailure();

    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.getFailure();

    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure();

    case DioExceptionType.badResponse:
      if (error.response != null && error.response?.statusCode != null && error.response?.statusMessage != null) {
        return _handleBadResponse(error);
      } else {
        return DataSource.default_.getFailure();
      }

    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();

    default:
      return DataSource.default_.getFailure();
  }
}

extension DataSourceExtension on DataSource {
  getFailure() {
    // var mContext = navigatorKey!.currentState!.context;
    switch (this) {
      case DataSource.success:
        return Failure("Success", ResponseMessage.success);
      case DataSource.noContent:
        return Failure("Success", ResponseMessage.noContent);

      case DataSource.badRequest:
        return Failure("Bad Request", ResponseMessage.badRequest);

      case DataSource.forbidden:
        return Failure("Failure", ResponseMessage.forbidden);


      case DataSource.unauthorised:
        return Failure("Failure", ResponseMessage.unauthorised);

      case DataSource.notFound:
        return Failure("Failure", ResponseMessage.notFound);

      case DataSource.internalServerError:
        return Failure("Error", ResponseMessage.internalServerError);


      case DataSource.connectTimeout:
        return Failure("Time Out", ResponseMessage.connectTimeout);

      case DataSource.cancel:
        return Failure("Error", ResponseMessage.cancel);

      case DataSource.receiveTimeout:
        return Failure("Time Out", ResponseMessage.receiveTimeout);


      case DataSource.sendTimeout:
        return Failure("Time Out", ResponseMessage.sendTimeout);


      case DataSource.cacheError:
        return Failure("Cache Error", ResponseMessage.cacheError);

      case DataSource.noInternetConnection:
        return Failure("No Internet", ResponseMessage.noInternetConnection);

      case DataSource.default_:
        return Failure("Error", ResponseMessage.default_);

    }
  }
}


class ResponseMessage {
  static const String success = "Success";
  static const String noContent = "Success with not content"; // success with no data (no content)
  static const String badRequest = "Bad request. try again later"; // failure, API rejected request
  static const String unauthorised = "User unauthorized, try again later"; // failure, user is not authorised
  static const String forbidden = "Forbidden request. try again later"; //  failure, API rejected request
  static const String internalServerError = "Something went wrong, try again later"; // failure, crash in server side
  static const String notFound = "Url not found, try again later"; // failure, crash in server side

  // local status code
  static const String connectTimeout = "Time out, try again later";
  static const String cancel = "Something went wrong, try again later";
  static const String receiveTimeout = "Time out, try again late";
  static const String sendTimeout = "Time out, try again late";
  static const String noInternetConnection = "Please check your internet connection";
  static const String default_ = "Something went wrong, try again later";
  static const String cacheError = "Cache error, try again later";
}


class Failure {
  String title;
  String message;

  Failure(this.title, this.message);

  @override
  String toString() {
    return 'Failure(title: $title, message: $message)';
  }
}

