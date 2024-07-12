import 'package:teste_pilar/app/modules/home/home.dart';

class TrendingMapper {
  static Future<TrendingEntity> toEntity(TrendingModel model) async {
    return TrendingEntity(
      day: await Future.wait(
          model.day.map((item) => MediaProductMapper.toEntity(item)).toList()),
      week: await Future.wait(
          model.week.map((item) => MediaProductMapper.toEntity(item)).toList()),
    );
  }
}
