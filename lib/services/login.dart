import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:loginapi/login/view/homepage_screen.dart';
import 'package:loginapi/services/navigator_services.dart';

class Login {
  static const String url = "http://10.0.2.2:8000/api/login";

  static Future<dynamic> userLogin(String username, String password) async {
    Dio dio = Dio();

    try {
      FormData formData =
          FormData.fromMap({"name": username, "password": password});

      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

      final response = await dio.post(
        url,
        data: formData,
      );
      var loginData = response.data;
      if (loginData != null) {
        NavigationService().replaceScreen(const HomePage());
      }
    } on DioError catch (e) {
      return e;
    }
  }
}
