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
  late GetDetailsUseCase sut;

  setUp(() {
    connectionService = ConnectionServiceSpy();
    repository = MediaProductRepositorySpy();
    sut = GetDetailsUseCaseImpl(
      connectionService: connectionService,
      repository: repository,
    );

    when(
      () => connectionService.checkConnection,
    ).thenAnswer((_) => Future.value());
  });

  test(
    "Should call get usecase trailers with success",
    () async {
      when(
        () => repository.getDetails(
          id: any(named: "id"),
          type: any(named: "type"),
        ),
      ).thenAnswer((_) async => Mocks.detailsEntityMock);

      final result = await sut.call(id: 1, type: "movie");

      expect(result, isA<DetailsEntity>());
      expect(result.tagline, Mocks.detailsEntityMock.tagline);
      expect(result.videos.results.length,
          Mocks.detailsEntityMock.videos.results.length);
    },
  );
}
