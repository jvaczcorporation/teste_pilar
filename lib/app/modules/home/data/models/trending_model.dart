import 'package:json_annotation/json_annotation.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

part 'trending_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TrendingModel {
  final List<MediaProductModel> day;
  final List<MediaProductModel> week;

  const TrendingModel({
    required this.day,
    required this.week,
  });

  factory TrendingModel.fromJson(Map<String, dynamic> json) =>
      _$TrendingModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrendingModelToJson(this);
}
