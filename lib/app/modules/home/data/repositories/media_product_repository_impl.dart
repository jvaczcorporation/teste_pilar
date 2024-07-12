import 'package:teste_pilar/app/commons/commons.dart';
import 'package:teste_pilar/app/modules/home/home.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

class MediaProductRepositoryImpl implements MediaProductRepository {
  final TheMovieDatasource datasource;

  MediaProductRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<DetailsEntity> getDetails({
    required int id,
    required String type,
  }) async {
    final resultModel = await datasource.getDetailsRemote(
      id: id,
      type: type,
    );
    try {
      return DetailsMapper.toEntity(resultModel);
    } catch (e) {
      throw FailureRepository(
        message: e.toString(),
      );
    }
  }

  @override
  Future<TrendingEntity> getTrending({required int page}) async {
    final resultModel = await datasource.getTrendingRemote(page: page);
    try {
      return TrendingMapper.toEntity(resultModel);
    } catch (e) {
      throw FailureRepository(
        message: e.toString(),
      );
    }
  }

  @override
  Future<PopularEntity> getPopular({required int page}) async {
    final resultModel = await datasource.getPopularRemote(page: page);
    try {
      return PopularMapper.toEntity(resultModel);
    } catch (e) {
      throw FailureRepository(
        message: e.toString(),
      );
    }
  }

  @override
  Future<List<MediaProductEntity>> search(
      {required String text, required int page}) async {
    final listResultModel = await datasource.searchRemote(
      text: text,
      page: page,
    );
    try {
      final listResult = await Future.wait(listResultModel
          .map((model) => MediaProductMapper.toEntity(model))
          .toList());

      return listResult;
    } catch (e) {
      throw FailureRepository(
        message: e.toString(),
      );
    }
  }

  @override
  Future<List<MediaProductEntity>> getTrailers({required int page}) async {
    final listUpcomings = await datasource.getUpcomingsRemote(page: page);
    try {
      final listDetailsResult = await Future.wait(
        listUpcomings
            .map((item) =>
                datasource.getDetailsRemote(id: item.id, type: "movie"))
            .toList(),
      );

      final listWithDetails = await Future.wait(
        listUpcomings.mapIndexed((index, item) {
          return MediaProductMapper.toEntity(
            item,
            details: DetailsMapper.toEntity(listDetailsResult[index]),
          );
        }).toList(),
      );

      return listWithDetails;
    } catch (e) {
      throw FailureRepository(
        message: e.toString(),
      );
    }
  }
}
