import 'package:dartz/dartz.dart';

import '../../di/di.dart';
import '../../util/api_exception.dart';
import '../datasource/authenticatin_datasource.dart';

abstract class IAuthRepository {
  Future<Either<String, String>> login(
    String confirmationCode,
  );
}

class AuthenticationRepository extends IAuthRepository {
  final IAuthenticationDatasource _datasource = locator.get();

  @override
  Future<Either<String, String>> login(String confirmationCode) async {
    try {
      String token = await _datasource.login(
        confirmationCode,
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
