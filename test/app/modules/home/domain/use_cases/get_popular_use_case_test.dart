import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_pilar/app/commons/commons.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

import '../../../../../mocks/mocks.dart';

class MediaProductRepositorySpy extends Mock
    implements MediaProductRepository {}

class ConnectionServiceSpy extends Mock implements ConnectionService {}

void main() {
  late ConnectionService connectionService;
  late MediaProductRepository repository;
  late GetPopularUseCase sut;

  setUp(() {
    repository = MediaProductRepositorySpy();
    connectionService = ConnectionServiceSpy();
    sut = GetPopularUseCaseImpl(
      connectionService: connectionService,
      repository: repository,
    );

    when(
      () => connectionService.checkConnection,
    ).thenAnswer((_) => Future.value());
  });

  test(
    "Should call get usecase popular with success",
    () async {
      when(
        () => repository.getPopular(page: any(named: "page")),
      ).thenAnswer((_) async => Mocks.popularEntityMock);

      final result = await sut.call();

      expect(result, isA<PopularEntity>());
      expect(result.movies.isNotEmpty, true);
      expect(result.movies.first.title,
          Mocks.popularEntityMock.movies.first.title);
      expect(result.series.isNotEmpty, true);
      expect(result.series.first.title,
          Mocks.popularEntityMock.series.first.title);
    },
  );
}
