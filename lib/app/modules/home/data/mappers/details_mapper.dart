import 'package:teste_pilar/app/modules/home/data/models/details_model.dart';
import 'package:teste_pilar/app/modules/home/domain/entities/details_entity.dart';

class DetailsMapper {
  static DetailsEntity toEntity(DetailsModel model) => DetailsEntity(
        credits: CastsMapper.toEntity(model.credits),
        videos: ResultsVideoMapper.toEntity(model.videos),
        tagline: model.tagline,
        genres: model.genres,
      );
}

class CastsMapper {
  static CreditsEntity toEntity(CreditsModel model) => CreditsEntity(
        cast: model.cast.map((item) => CastMapper.toEntity(item)).toList(),
      );
}

class CastMapper {
  static CastEntity toEntity(CastModel model) => CastEntity(
        name: model.name,
        character: model.character,
        profilePath: model.profilePath,
      );
}

class ResultsVideoMapper {
  static ResultsVideoEntity toEntity(ResultsVideoModel model) =>
      ResultsVideoEntity(
        results:
            model.results.map((item) => VideoMapper.toEntity(item)).toList(),
      );
}

class VideoMapper {
  static VideoEntity toEntity(VideoModel model) => VideoEntity(
        name: model.name,
        key: model.key,
        site: model.site,
        type: model.type,
      );
}
