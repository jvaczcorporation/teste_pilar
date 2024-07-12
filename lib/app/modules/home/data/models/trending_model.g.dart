// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingModel _$TrendingModelFromJson(Map<String, dynamic> json) =>
    TrendingModel(
      day: (json['day'] as List<dynamic>)
          .map((e) => MediaProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      week: (json['week'] as List<dynamic>)
          .map((e) => MediaProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrendingModelToJson(TrendingModel instance) =>
    <String, dynamic>{
      'day': instance.day.map((e) => e.toJson()).toList(),
      'week': instance.week.map((e) => e.toJson()).toList(),
    };
