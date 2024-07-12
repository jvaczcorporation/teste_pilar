import 'package:teste_pilar/app/modules/home/home.dart';

import '../../../../commons/commons.dart';

abstract class GetDetailsUseCase {
  Future<DetailsEntity> call({
    required int id,
    required String type,
  });
}

class GetDetailsUseCaseImpl implements GetDetailsUseCase {
  final ConnectionService connectionService;
  final MediaProductRepository repository;

  GetDetailsUseCaseImpl({
    required this.connectionService,
    required this.repository,
  });

  @override
  Future<DetailsEntity> call({required int id, required String type}) async {
    await connectionService.checkConnection;

    return await repository.getDetails(
      id: id,
      type: type,
    );
  }
}
