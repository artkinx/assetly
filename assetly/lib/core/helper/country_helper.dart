import 'dart:convert';

import 'package:assetly/data/response/country_response.dart';
import 'package:flutter/services.dart';

class CountryHelper {
  static Future<List<CountryResponse>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/countries.json');
    final data = await jsonDecode(response);

    var d =
        (data as List).map((value) => CountryResponse.fromJson(value)).toList();
    return d;
  }
}
