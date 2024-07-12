import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_pilar/app/commons/commons.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

import '../../../../../../mocks/mocks.dart';

class GetDetailsUseCaseSpy extends Mock implements GetDetailsUseCase {}

void main() {
  late DetailsStore store;
  late GetDetailsUseCase getDetailsUseCase;
  late DetailsController sut;

  setUp(() {
    store = DetailsStore();
    getDetailsUseCase = GetDetailsUseCaseSpy();
    sut = DetailsController(store: store, getDetailsUseCase: getDetailsUseCase);
  });
  group("searchByText", () {
    test(
      "Should call get details with success",
      () async {
        when(
          () => getDetailsUseCase(
            id: any(named: "id"),
            type: any(named: "type"),
          ),
        ).thenAnswer((_) async => Mocks.detailsEntityMock);

        await sut.fetchDetails(Mocks.mediaProductEntityMock);

        expect(store.state, StoreState.completed);
        expect(store.mediaProduct, isA<MediaProductEntity>());
        expect(store.mediaProduct!.id, Mocks.mediaProductEntityMock.id);
        expect(store.mediaProduct!.title, Mocks.mediaProductEntityMock.title);
        expect(store.mediaProduct!.details, isA<DetailsEntity>());
        expect(
          store.mediaProduct!.details!.tagline,
          Mocks.detailsEntityMock.tagline,
        );
      },
    );

    test(
      "Failure to get details data",
      () async {
        when(
          () => getDetailsUseCase(
            id: any(named: "id"),
            type: any(named: "type"),
          ),
        ).thenThrow(
          FailureRepository(message: "message"),
        );

        await sut.fetchDetails(Mocks.mediaProductEntityMock);

        expect(store.state, StoreState.error);
        expect(store.error, equals("message"));
        expect(store.exception, isA<FailureRepository>());
      },
    );

    test(
      "Emit generic exception error in get details data",
      () async {
        when(
          () => getDetailsUseCase(
            id: any(named: "id"),
            type: any(named: "type"),
          ),
        ).thenThrow(
          Exception(),
        );

        await sut.fetchDetails(Mocks.mediaProductEntityMock);

        expect(store.state, StoreState.error);
        expect(store.exception, isA<Exception>());
      },
    );
  });
}
