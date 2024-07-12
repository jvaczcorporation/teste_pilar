import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

import '../../../../commons/env.dart';

class MediaProductMapper {
  static Future<MediaProductEntity> toEntity(
    MediaProductModel model, {
    DetailsEntity? details,
  }) async {
    PaletteGenerator? pallet = model.backdropPath != null
        ? await _getDominantColor("${Env.imageUrl}/w200${model.backdropPath}")
        : null;

    return MediaProductEntity(
      id: model.id,
      genreIds: model.genreIds,
      adult: model.adult,
      backdropPath: model.backdropPath,
      overview: model.overview,
      popularity: model.popularity,
      posterPath: model.posterPath,
      releaseDate: model.releaseDate ?? model.firstAirDate ?? DateTime.now(),
      title: model.title ?? model.name!,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount,
      backgroundColor: pallet?.darkVibrantColor?.color ?? Colors.black,
      ligthColor: pallet?.lightVibrantColor?.color ?? Colors.white,
      mediaType: model.mediaType,
      details: details,
    );
  }

  static Future<PaletteGenerator> _getDominantColor(String imageUrl) async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(imageUrl),
    );

    return paletteGenerator;
  }
}
