import 'package:either_dart/either.dart';

import '../data/banner_data.dart';
import '../di/di.dart';
import '../model/banner.dart';
import '../util/api_exception.dart';

abstract class BannerRepository {
  Future<Either<String, List<Banner>>> getBanners();
}

class Bannerrepository extends BannerRepository {
  final BannerDatasource _datasource = locator.get();

  @override
  Future<Either<String, List<Banner>>> getBanners() async {
    try {
      var response = await _datasource.getBanners();
      return Right(response.cast<Banner>());
    } on ApiException catch (ex) {
      return Left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
