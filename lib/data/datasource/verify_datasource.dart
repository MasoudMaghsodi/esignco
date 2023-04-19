import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../di/di.dart';
import '../../util/api_exception.dart';

abstract class IAuthenticationDatasource {
  Future<int> verify(int confirmationCode);
}

class AuthenticationRemote implements IAuthenticationDatasource {
  final Dio _dio = locator.get();
  final TextEditingController verifycontroller = TextEditingController();

  @override
  Future<int> verify(int confirmationCode) async {
    try {
      var response = await _dio.post(
          'https://ws.esignco.ir/api/v1/userManagement/user/verifyUser',
          data: {
            'verifycontroller': verifycontroller,
          });
      if (response.statusCode == 200) {
        return response.data?['token'];
      }
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
    return 0;
  }
}
