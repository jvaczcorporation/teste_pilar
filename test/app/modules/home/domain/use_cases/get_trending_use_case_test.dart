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
  late GetTrendingUseCase sut;

  setUp(() {
    connectionService = ConnectionServiceSpy();

    repository = MediaProductRepositorySpy();
    sut = GetTrendingUseCaseImpl(
      connectionService: connectionService,
      repository: repository,
    );

    when(
      () => connectionService.checkConnection,
    ).thenAnswer((_) => Future.value());
  });

  test(
    "Should call get usecase trending with success",
    () async {
      when(
        () => repository.getTrending(page: any(named: "page")),
      ).thenAnswer((_) async => Mocks.trendingEntityMock);

      final result = await sut.call();

      expect(result, isA<TrendingEntity>());
      expect(result.day.isNotEmpty, true);
      expect(result.day.first.title, Mocks.trendingEntityMock.day.first.title);
      expect(result.week.isNotEmpty, true);
      expect(
          result.week.first.title, Mocks.trendingEntityMock.week.first.title);
    },
  );
}
