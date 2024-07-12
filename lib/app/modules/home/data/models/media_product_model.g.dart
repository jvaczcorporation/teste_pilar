// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaProductModel _$MediaProductModelFromJson(Map<String, dynamic> json) =>
    MediaProductModel(
      id: (json['id'] as num).toInt(),
      genreIds: (json['genre_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      adult: json['adult'] as bool,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: (json['vote_count'] as num).toInt(),
      title: json['title'] as String?,
      name: json['name'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      posterPath: json['poster_path'] as String?,
      releaseDate: _$JsonConverterFromJson<String, DateTime?>(
          json['release_date'], const DateConverter().fromJson),
      firstAirDate: _$JsonConverterFromJson<String, DateTime?>(
          json['first_air_date'], const DateConverter().fromJson),
      mediaType: json['media_type'] as String?,
    );

Map<String, dynamic> _$MediaProductModelToJson(MediaProductModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'genre_ids': instance.genreIds,
    'adult': instance.adult,
    'overview': instance.overview,
    'popularity': instance.popularity,
    'vote_average': instance.voteAverage,
    'vote_count': instance.voteCount,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('backdrop_path', instance.backdropPath);
  writeNotNull('poster_path', instance.posterPath);
  writeNotNull(
      'release_date', const DateConverter().toJson(instance.releaseDate));
  writeNotNull(
      'first_air_date', const DateConverter().toJson(instance.firstAirDate));
  writeNotNull('title', instance.title);
  writeNotNull('name', instance.name);
  writeNotNull('media_type', instance.mediaType);
  return val;
}

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
