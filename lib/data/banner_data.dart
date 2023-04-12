import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../di/di.dart';
import '../util/api_exception.dart';

abstract class BannerDatasource {
  Future<List<Banner>> getBanners();
}

class BannerRemoteDatasource extends BannerDatasource {
  final Dio _dio = locator.get();
  @override
  Future<List<Banner>> getBanners() async {
    try {
      var respones = await _dio.get(
          'https://ws.esignco.ir/api/v1/slider/banner?SliderType=slider&LandingPageId=home-landing');
      return respones.data['items']
          .map<Banner>((jsonObject) => Banner.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }
}
