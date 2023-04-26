import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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
      );
      emit(AuthResponseState(response));
    }));
  }
}

class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
  final IAuthRepository _repository = locator.get();
  VerifyBloc() : super(VerifyInitiateState()) {
    on<AuthVerifyRequest>(((event, emit) async {
      emit(VerifyLodingState());
      var response = await _repository.verify(
        event.confirmationCode,
      );
      emit(VerifyResponseState(response));
    }));
  }
}

// class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
//   final Dio _dio;
//   VerifyBloc(super.initialState, {Dio? dio}) : _dio = dio ?? Dio();
//   @override
//   Stream<VerifyState> mapEventToState(VerifyEvent event) async* {
//     if (event is VerifyInitiateState) {
//       try {
//         Response response = await _dio
//             .get('https://ws.esignco.ir/api/v1/userManagement/user/login');
//         yield VerifyResponseState(response.data);
//       } catch (e) {
//         yield VerifyLodingState();
//       }
//     }
//   }
// }
