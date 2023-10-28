import 'dart:convert';

import 'package:dio/dio.dart';

class DIoClient {
  static Future<Response> postAsync(Object? data, String url) async {
    var resp =
        await Dio().request(url, data: data, options: Options(method: "POST"));

    return resp;
  }

  static Future<Response> getAsync(String url) async {
    var resp = await Dio().request(url, options: Options(method: "GET"));

    return resp;
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
