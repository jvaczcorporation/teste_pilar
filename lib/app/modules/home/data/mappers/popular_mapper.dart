import 'package:teste_pilar/app/modules/home/home.dart';

class PopularMapper {
  static Future<PopularEntity> toEntity(PopularModel model) async {
    return PopularEntity(
      movies: await Future.wait(model.movies
          .map((item) => MediaProductMapper.toEntity(item))
          .toList()),
      series: await Future.wait(model.series
          .map((item) => MediaProductMapper.toEntity(item))
          .toList()),
    );
  }
}
