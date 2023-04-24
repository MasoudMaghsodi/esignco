import 'package:dartz/dartz.dart';

import '../../di/di.dart';
import '../../util/api_exception.dart';
import '../datasource/authenticatin_datasource.dart';

abstract class IAuthRepository {
  Future<Either<String, String>> login(
    String mobile,
  );
  Future<Either<String, String>> verify(
      String confirmationCode, String confirmationToken);
}

class AuthenticationRepository extends IAuthRepository {
  final IAuthenticationDatasource _datasource = locator.get();

  @override
  Future<Either<String, String>> login(String mobile) async {
    try {
      String token = await _datasource.login(
        mobile,
        //confirmationcode,
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

  @override
  Future<Either<String, String>> verify(
      String confirmationCode, String confirmationToken) async {
    try {
      String token = await _datasource.verify(
        confirmationCode,
        confirmationToken,
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
