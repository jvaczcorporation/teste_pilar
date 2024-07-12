import 'package:equatable/equatable.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

class TrendingEntity extends Equatable {
  final List<MediaProductEntity> day;
  final List<MediaProductEntity> week;

  const TrendingEntity({
    required this.day,
    required this.week,
  });

  @override
  List<Object?> get props => [
        day,
        week,
      ];
}
