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
  late GetTrailersUseCase sut;

  setUp(() {
    repository = MediaProductRepositorySpy();
    connectionService = ConnectionServiceSpy();
    sut = GetTrailersUseCaseImpl(
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
        () => repository.getTrailers(page: any(named: "page")),
      ).thenAnswer((_) async => [Mocks.mediaProductEntityMock]);

      final result = await sut.call();

      expect(result, isA<List<MediaProductEntity>>());
      expect(result.isNotEmpty, true);
      expect(result.first.title, Mocks.mediaProductEntityMock.title);
    },
  );
}
