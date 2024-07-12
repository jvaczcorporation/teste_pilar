import 'package:teste_pilar/app/modules/home/home.dart';

abstract class MediaProductRepository {
  Future<TrendingEntity> getTrending({required int page});
  Future<PopularEntity> getPopular({required int page});
  Future<DetailsEntity> getDetails({
    required int id,
    required String type,
  });
  Future<List<MediaProductEntity>> search(
      {required String text, required int page});
  Future<List<MediaProductEntity>> getTrailers({required int page});
}
