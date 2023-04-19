import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:esign/data/repository/authentication_repository.dart';
import 'package:esign/di/di.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _repository = locator.get();
  AuthBloc() : super(AuthInitiateState()) {
    on<AuthLoginRequest>(((event, emit) async {
      emit(AuthLodingState());
      var response = await _repository.login(
        event.mobile,
        //event.confirmationcode
      );
      emit(AuthResponseState(response));
    }));
  }
}

// class VerifyBloc extends Bloc<AuthEvent, AuthState> {
//   final IAuthRepository _repository = locator.get();
//   VerifyBloc() : super(AuthInitiateState()) {
//     on<AuthVerifyRequest>(((event, emit) async {
//       emit(AuthLodingState());
//       var response = await _repository.login(
//         event.confirmationCode
//       );
//       emit(AuthResponseState(response));
//     }));
//   }
// }
