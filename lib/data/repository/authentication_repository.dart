import 'package:dartz/dartz.dart';

import '../../di/di.dart';
import '../../util/api_exception.dart';
import '../datasource/authenticatin_datasource.dart';

abstract class IAuthRepository {
  Future<Either<String, String>> register(String phonenumber);

  Future<Either<String, String>> login(
    String phonenumber,
    // String sendcode,
  );
}

class AuthenticationRepository extends IAuthRepository {
  final IAuthenticationDatasource _datasource = locator.get();

  @override
  Future<Either<String, String>> register(String phonenumber) async {
    try {
      await _datasource.register('09197295165');
      return right('ثبت نام انجام شد');
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا');
    }
  }

  @override
  Future<Either<String, String>> login(String phonenumber) async {
    try {
      String token = await _datasource.login(
        phonenumber,
        //sendcode,
      );
      if (token.isNotEmpty) {
        return right('شما وارد شدید');
      } else {
        return left('خطایی در ورود پیش امده');
      }
    } on ApiException catch (ex) {
      return left('${ex.message}');
    }
  }
}
