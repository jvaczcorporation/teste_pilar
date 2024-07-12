import 'package:teste_pilar/app/commons/commons.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

abstract class SearchUseCase {
  Future<List<MediaProductEntity>> call({required String text, int page = 1});
}

class SearchUseCaseImpl implements SearchUseCase {
  final ConnectionService connectionService;
  final MediaProductRepository repository;

  SearchUseCaseImpl({
    required this.connectionService,
    required this.repository,
  });

  @override
  Future<List<MediaProductEntity>> call({
    required String text,
    int page = 1,
  }) async {
    await connectionService.checkConnection;

    return await repository.search(
      text: text,
      page: page,
    );
  }
}
