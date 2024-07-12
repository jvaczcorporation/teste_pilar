import 'package:json_annotation/json_annotation.dart';
import 'package:teste_pilar/app/modules/home/data/models/date_converter.dart';

part 'media_product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MediaProductModel {
  final int id;
  final List<int> genreIds;
  final bool adult;
  final String overview;
  final double popularity;
  final double voteAverage;
  final int voteCount;
  final String? backdropPath;
  final String? posterPath;
  @DateConverter()
  final DateTime? releaseDate;
  @DateConverter()
  final DateTime? firstAirDate;
  final String? title;
  final String? name;
  final String? mediaType;

  const MediaProductModel({
    required this.id,
    required this.genreIds,
    required this.adult,
    required this.overview,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
    this.title,
    this.name,
    this.backdropPath,
    this.posterPath,
    this.releaseDate,
    this.firstAirDate,
    this.mediaType,
  });

  factory MediaProductModel.fromJson(Map<String, dynamic> json) =>
      _$MediaProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$MediaProductModelToJson(this);
}
