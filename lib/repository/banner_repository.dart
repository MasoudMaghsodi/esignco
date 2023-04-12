

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
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}