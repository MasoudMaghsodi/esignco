import 'package:dio/dio.dart';
import 'package:esign/data/datasource/authenticatin_datasource.dart';
import 'package:flutter/material.dart';

import '../../di/di.dart';
import '../../util/api_exception.dart';

abstract class IAuthenticationDatasource {
  Future<String> verify(String confirmationCode, String confirmationToken);
}

class AuthenticationRemote implements IAuthenticationDatasource {
  final Dio _dio = locator.get();

  @override
  Future<String> verify(
      String confirmationCode, String confirmationToken) async {
    try {
      var response = await _dio.post(
          'https://ws.esignco.ir/api/v1/userManagement/user/verifyUser',
          data: {
            'confirmationCode': confirmationCode,
            'confirmationToken': token(),
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
