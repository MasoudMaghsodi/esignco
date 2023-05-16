import 'package:dio/dio.dart';
import '../../di/di.dart';
import '../../util/api_exception.dart';

abstract class IAuthenticationDatasource {
  Future<String> login(String mobile);
  Future<String> verify(String confirmationCode);
}

class AuthenticationRemote implements IAuthenticationDatasource {
  final Dio _dio = locator.get();
  String token = '';

  @override
  Future<String> login(String mobile) async {
    try {
      var response = await _dio.post(
          'https://ws.esignco.ir/api/v1/userManagement/user/login',
          data: {
            'mobile': mobile,
          });
      if (response.statusCode == 200) {
        return response.data?['token'];
        //return token;
      }
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
    return '';
  }

  @override
  Future<String> verify(String confirmationCode) async {
    try {
      var response = await _dio.post(
        'https://ws.esignco.ir/api/v1/userManagement/user/verifyUser',
        data: {
          'confirmationCode': confirmationCode,
          //'confirmationToken': token,
        },
      );
      if (response.statusCode == 200) {
        return response.data?['confirmationToken'];
      }
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
    return '';
  }
}
