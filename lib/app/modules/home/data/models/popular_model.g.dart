// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularModel _$PopularModelFromJson(Map<String, dynamic> json) => PopularModel(
      movies: (json['movies'] as List<dynamic>)
          .map((e) => MediaProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      series: (json['series'] as List<dynamic>)
          .map((e) => MediaProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PopularModelToJson(PopularModel instance) =>
    <String, dynamic>{
      'movies': instance.movies.map((e) => e.toJson()).toList(),
      'series': instance.series.map((e) => e.toJson()).toList(),
    };
