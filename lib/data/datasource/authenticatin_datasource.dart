import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../di/di.dart';
import '../../util/api_exception.dart';

abstract class IAuthenticationDatasource {
  Future<String> login(String mobile);
  Future<String> verify(String confirmationCode, String confirmationToken);
}

class AuthenticationRemote implements IAuthenticationDatasource {
  final Dio _dio = locator.get();
  var token;

  @override
  Future<String> login(String mobile) async {
    try {
      var response = await _dio.post(
          'https://ws.esignco.ir/api/v1/userManagement/user/login',
          data: {
            'mobile': mobile,
          });
      if (response.statusCode == 200) {
        token = response.data?['confirmationToken'];
        return token;
      }
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
    return '';
  }

  @override
  Future<String> verify(
      String confirmationCode, String confirmationToken) async {
    try {
      var response = await _dio.post(
          'https://ws.esignco.ir/api/v1/userManagement/user/verifyUser',
          data: {
            'confirmationCode': confirmationCode,
            'confirmationToken': token,
          });
      if (response.statusCode == 200) {
        return response.data?['token'];
      }
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
    return '';
  }
}

// Future<String> token() async {
//   String url = 'https://ws.esignco.ir/api/v1/userManagement/user/login';
//   http.Response token = await http.get(Uri.parse(url));
//   return json.decode(token.body);
// }
