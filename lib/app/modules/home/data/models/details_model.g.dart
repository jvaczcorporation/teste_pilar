// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsModel _$DetailsModelFromJson(Map<String, dynamic> json) => DetailsModel(
      credits: CreditsModel.fromJson(json['credits'] as Map<String, dynamic>),
      videos:
          ResultsVideoModel.fromJson(json['videos'] as Map<String, dynamic>),
      tagline: json['tagline'] as String,
      genres: (json['genres'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$DetailsModelToJson(DetailsModel instance) =>
    <String, dynamic>{
      'credits': instance.credits.toJson(),
      'videos': instance.videos.toJson(),
      'tagline': instance.tagline,
      'genres': instance.genres,
    };

CreditsModel _$CreditsModelFromJson(Map<String, dynamic> json) => CreditsModel(
      cast: (json['cast'] as List<dynamic>)
          .map((e) => CastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreditsModelToJson(CreditsModel instance) =>
    <String, dynamic>{
      'cast': instance.cast.map((e) => e.toJson()).toList(),
    };

CastModel _$CastModelFromJson(Map<String, dynamic> json) => CastModel(
      name: json['name'] as String,
      character: json['character'] as String,
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$CastModelToJson(CastModel instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'character': instance.character,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('profile_path', instance.profilePath);
  return val;
}

ResultsVideoModel _$ResultsVideoModelFromJson(Map<String, dynamic> json) =>
    ResultsVideoModel(
      results: (json['results'] as List<dynamic>)
          .map((e) => VideoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultsVideoModelToJson(ResultsVideoModel instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => VideoModel(
      name: json['name'] as String,
      key: json['key'] as String,
      site: json['site'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'type': instance.type,
    };
