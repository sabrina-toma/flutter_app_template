import 'package:dio/dio.dart';

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

Failure _handleBadResponse(DioException error) {

  if (error.response?.statusCode == 401) {
    return Failure("Failure", "Invalid user name or password, please try again.");
  } else if (error.response?.statusCode == 400) {
    // return Failure("Failure", 'Incorrect current password.');
  }
  return DataSource.DEFAULT.getFailure();
}

Failure _handleError(DioException error) {
  switch (error.type) {
  // case DioExceptionType.connectionError:
  //   return DataSource.NO_INTERNET_CONNECTION.getFailure();

    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();

    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();

    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();

    case DioExceptionType.badResponse:
      if (error.response != null && error.response?.statusCode != null && error.response?.statusMessage != null) {
        return _handleBadResponse(error);
      } else {
        return DataSource.DEFAULT.getFailure();
      }

    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();

    default:
      return DataSource.DEFAULT.getFailure();
  }
}

extension DataSourceExtension on DataSource {
  getFailure() {
    // var mContext = navigatorKey!.currentState!.context;
    switch (this) {
      case DataSource.SUCCESS:
        return Failure("Success", ResponseMessage.SUCCESS);
      case DataSource.NO_CONTENT:
        return Failure("Success", ResponseMessage.NO_CONTENT);

      case DataSource.BAD_REQUEST:
        return Failure("Bad Request", ResponseMessage.BAD_REQUEST);

      case DataSource.FORBIDDEN:
        return Failure("Failure", ResponseMessage.FORBIDDEN);


      case DataSource.UNAUTORISED:
        return Failure("Failure", ResponseMessage.UNAUTORISED);

      case DataSource.NOT_FOUND:
        return Failure("Failure", ResponseMessage.NOT_FOUND);

      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure("Error", ResponseMessage.INTERNAL_SERVER_ERROR);


      case DataSource.CONNECT_TIMEOUT:
        return Failure("Time Out", ResponseMessage.CONNECT_TIMEOUT);

      case DataSource.CANCEL:
        return Failure("Error", ResponseMessage.CANCEL);

      case DataSource.RECIEVE_TIMEOUT:
        return Failure("Time Out", ResponseMessage.RECIEVE_TIMEOUT);


      case DataSource.SEND_TIMEOUT:
        return Failure("Time Out", ResponseMessage.SEND_TIMEOUT);


      case DataSource.CACHE_ERROR:
        return Failure("Cache Error", ResponseMessage.CACHE_ERROR);

      case DataSource.NO_INTERNET_CONNECTION:
        return Failure("No Internet", ResponseMessage.NO_INTERNET_CONNECTION);

      case DataSource.DEFAULT:
        return Failure("Error", ResponseMessage.DEFAULT);

    }
  }
}


class ResponseMessage {
  static const String SUCCESS = "Success";
  static const String NO_CONTENT = "Success with not content"; // success with no data (no content)
  static const String BAD_REQUEST = "Bad request. try again later"; // failure, API rejected request
  static const String UNAUTORISED = "User unauthorized, try again later"; // failure, user is not authorised
  static const String FORBIDDEN = "Forbidden request. try again later"; //  failure, API rejected request
  static const String INTERNAL_SERVER_ERROR = "Something went wrong, try again later"; // failure, crash in server side
  static const String NOT_FOUND = "Url not found, try again later"; // failure, crash in server side

  // local status code
  static const String CONNECT_TIMEOUT = "Time out, try again later";
  static const String CANCEL = "Something went wrong, try again later";
  static const String RECIEVE_TIMEOUT = "Time out, try again late";
  static const String SEND_TIMEOUT = "Time out, try again late";
  static const String NO_INTERNET_CONNECTION = "Please check your internet connection";
  static const String DEFAULT = "Something went wrong, try again later";
  static const String CACHE_ERROR = "Cache error, try again later";
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

