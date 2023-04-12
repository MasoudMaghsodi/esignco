import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/banner_data.dart';
import '../repository/banner_repository.dart';

var locator = GetIt.instance;
Future<void> getItInit() async {
  //componenets
  locator.registerSingleton<Dio>(
      Dio(BaseOptions(baseUrl: 'http://startflutter.ir/api/')));

  //datasources

  locator.registerFactory<BannerDatasource>(() => BannerRemoteDatasource());

  //repositories

  locator.registerFactory<BannerRepository>(() => Bannerrepository());
}
