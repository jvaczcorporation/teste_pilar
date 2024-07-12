import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:teste_pilar/app/commons/env.dart';
import 'package:teste_pilar/app/modules/home/domain/entities/details_entity.dart';

class MediaProductEntity extends Equatable {
  final int id;
  final List<int> genreIds;
  final bool adult;
  final String? backdropPath;
  final String overview;
  final double popularity;
  final String? posterPath;
  final DateTime releaseDate;
  final String title;
  final double voteAverage;
  final int voteCount;
  final bool isLoading;
  final Color backgroundColor;
  final Color ligthColor;
  final String? mediaType;
  final DetailsEntity? details;

  const MediaProductEntity({
    required this.id,
    required this.genreIds,
    required this.adult,
    required this.overview,
    required this.popularity,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
    required this.backgroundColor,
    required this.ligthColor,
    this.backdropPath,
    this.posterPath,
    this.isLoading = false,
    this.mediaType,
    this.details,
  });

  MediaProductEntity copyWith({
    int? id,
    List<int>? genreIds,
    bool? adult,
    String? backdropPath,
    String? overview,
    double? popularity,
    String? posterPath,
    DateTime? releaseDate,
    String? title,
    double? voteAverage,
    int? voteCount,
    bool? isLoading,
    Color? backgroundColor,
    Color? ligthColor,
    String? mediaType,
    DetailsEntity? details,
  }) {
    return MediaProductEntity(
      id: id ?? this.id,
      genreIds: genreIds ?? this.genreIds,
      adult: adult ?? this.adult,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      ligthColor: ligthColor ?? this.ligthColor,
      backdropPath: backdropPath ?? this.backdropPath,
      posterPath: posterPath ?? this.posterPath,
      isLoading: isLoading ?? this.isLoading,
      mediaType: mediaType ?? this.mediaType,
      details: details ?? this.details,
    );
  }

  String get urlImageBlackdrop => backdropPath != null
      ? "${Env.imageUrl}/w500$backdropPath"
      : Env.blankImageUrl;

  String get urlImagePoster => posterPath != null
      ? "${Env.imageUrl}/w200$posterPath"
      : Env.blankImageUrl;

  double get percentVoteAverage => (voteAverage * 10) / 100;

  @override
  List<Object?> get props => [
        id,
        id,
        genreIds,
        adult,
        backdropPath,
        overview,
        popularity,
        posterPath,
        releaseDate,
        voteAverage,
        voteCount,
        isLoading,
        mediaType,
        details,
      ];
}
