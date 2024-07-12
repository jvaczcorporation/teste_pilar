import 'package:equatable/equatable.dart';
import 'package:teste_pilar/app/commons/env.dart';

class DetailsEntity extends Equatable {
  final CreditsEntity credits;
  final ResultsVideoEntity videos;
  final String tagline;
  final List<Map<String, dynamic>> genres;

  const DetailsEntity({
    required this.credits,
    required this.videos,
    required this.tagline,
    required this.genres,
  });

  bool get hasVideos => videos.results.isNotEmpty;

  @override
  List<Object?> get props => [
        credits,
        videos,
        tagline,
        genres,
      ];
}

class CreditsEntity extends Equatable {
  final List<CastEntity> cast;

  const CreditsEntity({
    required this.cast,
  });

  @override
  List<Object?> get props => [
        cast,
      ];
}

class CastEntity extends Equatable {
  final String name;
  final String character;
  final String? profilePath;

  String get urlImageProfile => profilePath != null
      ? "${Env.imageUrl}/w200$profilePath"
      : Env.blankImageUrl;

  const CastEntity({
    required this.name,
    required this.character,
    this.profilePath,
  });

  @override
  List<Object?> get props => [
        name,
        character,
        profilePath,
      ];
}

class ResultsVideoEntity extends Equatable {
  final List<VideoEntity> results;

  const ResultsVideoEntity({
    required this.results,
  });

  @override
  List<Object?> get props => [
        results,
      ];
}

class VideoEntity extends Equatable {
  final String name;
  final String key;
  final String site;
  final String type;

  String get urlYoutube => "${Env.imageUrl}/watch?v=$key";

  const VideoEntity({
    required this.name,
    required this.key,
    required this.site,
    required this.type,
  });

  @override
  List<Object?> get props => [
        name,
        key,
        site,
        type,
      ];
}
