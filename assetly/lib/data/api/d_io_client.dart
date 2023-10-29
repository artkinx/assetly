import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class DIoClient {
  static Future<Response> postAsync(Object? data, String url) async {
    var resp =
        await Dio().request(url, data: data, options: Options(method: "POST"));

    return resp;
  }

  static Future<Response?> getAsync(String url) async {
    try {
      var resp = await Dio().get(url, options: Options());
      return resp;
    } on SocketException catch (_, e) {
      print(e);
      return null;
    } on DioException catch (_, e) {
      print(e);
      return null;
    }
  }

  static T checkResponseStats<T>(Response response) {
    if (response.statusCode != 200) {
      return null as T;
    }

    print(response.data);
    var d = jsonDecode(response.data);

    return d as T;
  }
}
