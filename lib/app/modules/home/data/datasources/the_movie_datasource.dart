import 'package:teste_pilar/app/modules/home/home.dart';

abstract class TheMovieDatasource {
  Future<TrendingModel> getTrendingRemote({required int page});
  Future<PopularModel> getPopularRemote({required int page});
  Future<DetailsModel> getDetailsRemote({
    required int id,
    required String type,
  });
  Future<List<MediaProductModel>> getUpcomingsRemote({required int page});
  Future<List<MediaProductModel>> searchRemote({
    required String text,
    required int page,
  });
}
