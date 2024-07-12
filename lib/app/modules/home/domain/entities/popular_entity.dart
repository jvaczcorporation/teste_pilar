import 'package:equatable/equatable.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

class PopularEntity extends Equatable {
  final List<MediaProductEntity> movies;
  final List<MediaProductEntity> series;

  const PopularEntity({
    required this.movies,
    required this.series,
  });

  @override
  List<Object?> get props => [
        movies,
        series,
      ];
}
