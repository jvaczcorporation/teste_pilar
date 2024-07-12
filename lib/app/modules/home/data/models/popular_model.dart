import 'package:json_annotation/json_annotation.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

part 'popular_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PopularModel {
  final List<MediaProductModel> movies;
  final List<MediaProductModel> series;

  const PopularModel({
    required this.movies,
    required this.series,
  });

  factory PopularModel.fromJson(Map<String, dynamic> json) =>
      _$PopularModelFromJson(json);

  Map<String, dynamic> toJson() => _$PopularModelToJson(this);
}
