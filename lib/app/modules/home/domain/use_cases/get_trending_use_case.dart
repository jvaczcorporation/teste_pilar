import 'package:teste_pilar/app/commons/commons.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

abstract class GetTrendingUseCase {
  Future<TrendingEntity> call({int page = 1});
}

class GetTrendingUseCaseImpl implements GetTrendingUseCase {
  final ConnectionService connectionService;
  final MediaProductRepository repository;

  GetTrendingUseCaseImpl({
    required this.connectionService,
    required this.repository,
  });

  @override
  Future<TrendingEntity> call({int page = 1}) async {
    await connectionService.checkConnection;

    return await repository.getTrending(page: page);
  }
}
