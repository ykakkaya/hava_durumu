import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class DioManager {
  late Dio dio;
  DioManager() {
    dio = Dio();
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      return HttpClient()
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
    };
  }
}
