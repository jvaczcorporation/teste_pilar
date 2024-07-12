import 'package:teste_pilar/app/commons/commons.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

abstract class GetTrailersUseCase {
  Future<List<MediaProductEntity>> call({int page = 1});
}

class GetTrailersUseCaseImpl implements GetTrailersUseCase {
  final ConnectionService connectionService;
  final MediaProductRepository repository;

  GetTrailersUseCaseImpl({
    required this.connectionService,
    required this.repository,
  });

  @override
  Future<List<MediaProductEntity>> call({int page = 1}) async {
    await connectionService.checkConnection;

    return await repository.getTrailers(page: page);
  }
}
