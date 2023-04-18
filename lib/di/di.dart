import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/datasource/authenticatin_datasource.dart';
import '../data/repository/authentication_repository.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  locator.registerSingleton<Dio>(
      Dio(BaseOptions(baseUrl: 'https://ws.esignco.ir/')));

  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  //datasources
  locator
      .registerFactory<IAuthenticationDatasource>(() => AuthenticationRemote());

  locator.registerFactory<IAuthRepository>(() => AuthenticationRepository());
}
