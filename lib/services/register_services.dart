import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class Register {
  //localhost url if using android emulator is http://10.0.2.2
  //localhost url for iOS is http://127.0.0.1
  static const String url = "http://10.0.2.2:8000/api/register";

  static Future<dynamic> userRegister(
      String username, String email, String password) async {
    Dio dio = Dio();

    try {
      FormData formData = FormData.fromMap(
          {"name": username, "email": email, "password": password});

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
      var checkUser = response.data;
      print(checkUser);
      return checkUser;
    } on DioError catch (e) {
      return e;
    }
  }
}
