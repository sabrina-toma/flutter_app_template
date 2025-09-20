import 'package:dio/dio.dart';

abstract class NetworkRepository {
  Dio getDio({bool isFormData = false, String? baseUrl});
}