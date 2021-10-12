import 'dart:convert';

import 'package:awesome_app/model/Weather.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<WeatherData?> fetchData(String city) {
  final String url = 'https://api.openweathermap.org/data/2.5/weather?q=' +
      city +
      '&units=metric&appid=f52b1464dfbc0921347e5af4f89145df';

  print(url);

  return http.get(Uri.parse(url)).then((data) {
    if (data.statusCode == 200) {
      final jsonData = json.decode(data.body);
      print(jsonData);
      return WeatherData.fromJson(jsonData);
    }
    throw Exception('something is wrong');
  }).catchError((e) => {debugPrint(e.toString())});
}
