import 'package:dependency_injection/src/shared/constants.dart';
import 'package:dio/dio.dart';

class CustomDio {
  Dio dio = Dio();

  CustomDio(){
    dio.options.baseUrl = URL_API;
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        return options;
      },
      onResponse: (Response response) {
        return response;
      },
      onError: (DioError e) {
        return e;
      }
    ));
  }

  Dio getClient() => dio;
}