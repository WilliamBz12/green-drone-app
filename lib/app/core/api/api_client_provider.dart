import 'package:dio/dio.dart';
import 'package:green_drone/app/core/constants/constants.dart';

class ApiClientProvider {
  final Dio dio;

  ApiClientProvider(this.dio);

  Dio client() {
    dio.options.baseUrl = Constants.url;
    return dio;
  }
}
