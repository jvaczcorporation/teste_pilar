import 'package:teste_pilar/app/commons/commons.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

class TheMovieDatasourceImpl implements TheMovieDatasource {
  final HttpService httpService;

  TheMovieDatasourceImpl({
    required this.httpService,
  });

  @override
  Future<DetailsModel> getDetailsRemote({
    required int id,
    required String type,
  }) async {
    try {
      final response = await httpService.get(
          "${Env.apiUrl}/$type/$id?language=pt-BR&append_to_response=credits,videos");

      if (response.statusCode != 200) {
        throw FailureDatasource(
          message: Messages.FAILED_GET_DATA,
        );
      }
      final result = DetailsModel.fromJson(response.data);

      return result;
    } catch (e) {
      throw FailureDatasource(
        message: e.toString(),
      );
    }
  }

  @override
  Future<TrendingModel> getTrendingRemote({required int page}) async {
    try {
      final responses = await Future.wait([
        httpService
            .get("${Env.apiUrl}/trending/movie/day?language=pt-BR&page=$page"),
        httpService
            .get("${Env.apiUrl}/trending/movie/week?language=pt-BR&page=$page")
      ]);

      if (responses.any((response) => response.statusCode != 200)) {
        throw FailureDatasource(
          message: Messages.FAILED_GET_DATA,
        );
      }
      final result = TrendingModel.fromJson({
        "day": responses[0].data["results"],
        "week": responses[1].data["results"],
      });

      return result;
    } catch (e) {
      throw FailureDatasource(
        message: e.toString(),
      );
    }
  }

  @override
  Future<PopularModel> getPopularRemote({required int page}) async {
    try {
      final responses = await Future.wait([
        httpService
            .get("${Env.apiUrl}/movie/popular?language=pt-BR&page=$page"),
        httpService.get("${Env.apiUrl}/tv/popular?language=pt-BR&page=$page")
      ]);

      if (responses.any((response) => response.statusCode != 200)) {
        throw FailureDatasource(
          message: Messages.FAILED_GET_DATA,
        );
      }

      final result = PopularModel.fromJson({
        "movies": responses[0].data["results"],
        "series": responses[1].data["results"].map((item) {
          item["media_type"] = "tv";
          return item;
        }).toList(),
      });

      return result;
    } catch (e) {
      throw FailureDatasource(
        message: e.toString(),
      );
    }
  }

  @override
  Future<List<MediaProductModel>> searchRemote(
      {required String text, required int page}) async {
    try {
      final response = await httpService.get(
          "${Env.apiUrl}/search/multi?query=$text&language=pt-BR&page=$page");

      if (response.statusCode != 200) {
        throw FailureDatasource(
          message: Messages.FAILED_GET_DATA,
        );
      }
      final result = (response.data["results"] as List)
          .where(
            (item) =>
                item["media_type"] == "movie" || item["media_type"] == "tv",
          )
          .map((item) => MediaProductModel.fromJson(item))
          .toList();

      return result;
    } catch (e) {
      throw FailureDatasource(
        message: e.toString(),
      );
    }
  }

  @override
  Future<List<MediaProductModel>> getUpcomingsRemote(
      {required int page}) async {
    try {
      final response = await httpService
          .get("${Env.apiUrl}/movie/upcoming?language=pt-BR&page=$page");

      if (response.statusCode != 200) {
        throw FailureDatasource(
          message: Messages.FAILED_GET_DATA,
        );
      }
      final result = (response.data["results"] as List)
          .map((item) => MediaProductModel.fromJson(item))
          .toList();

      return result;
    } catch (e) {
      throw FailureDatasource(
        message: e.toString(),
      );
    }
  }
}
