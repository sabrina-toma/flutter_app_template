import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter/foundation.dart';

import '../constants/constants.dart';
import 'network_repository.dart';

class NetworkRepositoryImpl implements NetworkRepository {

  NetworkRepositoryImpl();

  @override
  Dio getDio({bool isFormData = false, String? baseUrl}) {
    Dio dio = Dio();

    dio.options = BaseOptions(
      baseUrl: baseUrl ?? Constants.baseUrlApi,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
      },
    );

    if (isFormData) {
      dio.options.headers[HttpHeaders.contentTypeHeader] = 'multipart/form-data';
    }

    /// Interceptor to handle unauthorized (401) globally
    dio.interceptors.add(InterceptorsWrapper(
      onError: (DioException e, handler) {
        if (e.response?.statusCode == 401) {
          // logout + redirect
        }
        return handler.next(e);
      },
    ));

    if (kReleaseMode) {
      log("No logs....");
    } else {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        error: true,
      ));
    }

    return dio;
  }
}
