import 'package:dio/dio.dart';

import '../../di/di.dart';
import '../../util/api_exception.dart';

abstract class IAuthenticationDatasource {
  Future<void> register(String phonenumber);

  Future<String> login(String phonenumber);
}

class AuthenticationRemote implements IAuthenticationDatasource {
  final Dio _dio = locator.get();

  @override
  Future<void> register(String phonenumber) async {
    try {
      final response = await _dio.post('v1/userManagement/user/login', data: {
        'phonenumber': phonenumber,
      });
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
  }

  @override
  Future<String> login(String phonenumber) async {
    try {
      var response = await _dio.post('url send code/auth with password', data: {
        'phonenumber': phonenumber,
        // 'sendcode': sendcode,
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
