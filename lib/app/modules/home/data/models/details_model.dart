import 'package:json_annotation/json_annotation.dart';

part 'details_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DetailsModel {
  final CreditsModel credits;
  final ResultsVideoModel videos;
  final String tagline;
  final List<Map<String, dynamic>> genres;

  const DetailsModel({
    required this.credits,
    required this.videos,
    required this.tagline,
    required this.genres,
  });

  factory DetailsModel.fromJson(Map<String, dynamic> json) =>
      _$DetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreditsModel {
  final List<CastModel> cast;

  const CreditsModel({
    required this.cast,
  });

  factory CreditsModel.fromJson(Map<String, dynamic> json) =>
      _$CreditsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreditsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CastModel {
  final String name;
  final String character;
  final String? profilePath;

  const CastModel({
    required this.name,
    required this.character,
    this.profilePath,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) =>
      _$CastModelFromJson(json);

  Map<String, dynamic> toJson() => _$CastModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResultsVideoModel {
  final List<VideoModel> results;

  const ResultsVideoModel({
    required this.results,
  });

  factory ResultsVideoModel.fromJson(Map<String, dynamic> json) =>
      _$ResultsVideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsVideoModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class VideoModel {
  final String name;
  final String key;
  final String site;
  final String type;

  const VideoModel({
    required this.name,
    required this.key,
    required this.site,
    required this.type,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}
