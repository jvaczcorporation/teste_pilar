import 'package:teste_pilar/app/commons/commons.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

abstract class GetPopularUseCase {
  Future<PopularEntity> call({int page = 1});
}

class GetPopularUseCaseImpl implements GetPopularUseCase {
  final ConnectionService connectionService;

  final MediaProductRepository repository;

  GetPopularUseCaseImpl({
    required this.connectionService,
    required this.repository,
  });

  @override
  Future<PopularEntity> call({int page = 1}) async {
    await connectionService.checkConnection;
    return await repository.getPopular(page: page);
  }
}
