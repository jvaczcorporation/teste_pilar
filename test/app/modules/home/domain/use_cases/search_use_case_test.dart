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
  late SearchUseCase sut;

  setUp(() {
    connectionService = ConnectionServiceSpy();

    repository = MediaProductRepositorySpy();
    sut = SearchUseCaseImpl(
      connectionService: connectionService,
      repository: repository,
    );

    when(
      () => connectionService.checkConnection,
    ).thenAnswer((_) => Future.value());
  });

  test(
    "Should call search by text with success",
    () async {
      when(
        () => repository.search(
            text: any(named: "text"), page: any(named: "page")),
      ).thenAnswer((_) async => [Mocks.mediaProductEntityMock]);

      final result = await sut.call(text: "text");

      expect(result, isA<List<MediaProductEntity>>());
      expect(result.isNotEmpty, true);
      expect(result.first.title, Mocks.mediaProductEntityMock.title);
    },
  );
}
