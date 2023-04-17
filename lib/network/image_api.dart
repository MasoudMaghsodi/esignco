// import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map> getPics() async {
  String url =
      'https://ws.esignco.ir/api/v1/slider/banner?SliderType=slider&LandingPageId=home-landing';
  http.Response response = await http.get(Uri.parse(url));
  return json.decode(response.body);
}

Future<Map> getPicsPageOne() async {
  String url =
      'https://ws.esignco.ir/api/v1/product/getSelectedProductList/fajr?pageSize=20&page=1';
  http.Response response = await http.get(Uri.parse(url));
  return json.decode(response.body);
}
