import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_pilar/app/commons/commons.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

import '../../../../../../mocks/mocks.dart';

class GetTrendingUseCaseSpy extends Mock implements GetTrendingUseCase {}

class GetPopularUseCaseSpy extends Mock implements GetPopularUseCase {}

class GetTrailersUseCaseSpy extends Mock implements GetTrailersUseCase {}

class SearchUseCaseSpy extends Mock implements SearchUseCase {}

class UiHelperSpy extends Mock implements UiHelper {}

void main() {
  late GetTrendingUseCase getTrendingUseCase;
  late GetPopularUseCase getPopularUseCase;
  late GetTrailersUseCase getTrailersUseCase;
  late SearchUseCase searchUseCase;
  late UiHelper uiHelper;
  late HomeStore store;
  late HomeController sut;

  setUp(() {
    getTrendingUseCase = GetTrendingUseCaseSpy();
    getPopularUseCase = GetPopularUseCaseSpy();
    getTrailersUseCase = GetTrailersUseCaseSpy();
    searchUseCase = SearchUseCaseSpy();
    uiHelper = UiHelperSpy();
    store = HomeStore();
    sut = HomeController(
      store: store,
      getTrendingUseCase: getTrendingUseCase,
      getPopularUseCase: getPopularUseCase,
      getTrailersUseCase: getTrailersUseCase,
      searchUseCase: searchUseCase,
      uiHelper: uiHelper,
    );

    when(
      () => uiHelper.showSnackBar(any()),
    ).thenReturn(null);
  });

  group("initialFetchData", () {
    test(
      "Should call initial fetch data with success",
      () async {
        when(
          () => getTrendingUseCase(),
        ).thenAnswer((_) async => Mocks.trendingEntityMock);
        when(
          () => getPopularUseCase(),
        ).thenAnswer((_) async => Mocks.popularEntityMock);
        when(
          () => getTrailersUseCase(),
        ).thenAnswer((_) async => [Mocks.mediaProductEntityMock]);

        await sut.initialFetchData();

        expect(store.state, StoreState.completed);
        expect(store.trending, isA<TrendingEntity>());
        expect(store.trending.day.length, equals(1));
        expect(
          store.trending.day.first.id,
          Mocks.trendingEntityMock.day.first.id,
        );
        expect(store.popular, isA<PopularEntity>());
        expect(store.popular.series.length, equals(1));
        expect(
          store.popular.series.first.id,
          Mocks.popularEntityMock.series.first.id,
        );
        expect(store.trailers, isA<List<MediaProductEntity>>());
        expect(store.popular.series.length, equals(1));
        expect(
          store.trailers.first.title,
          Mocks.mediaProductEntityMock.title,
        );
      },
    );

    test(
      "Failure initial fetch data",
      () async {
        when(
          () => getTrendingUseCase(),
        ).thenThrow(
          FailureRepository(message: "message"),
        );

        await sut.initialFetchData();

        expect(store.state, StoreState.error);
        expect(store.error, equals("message"));
        expect(store.exception, isA<FailureRepository>());
      },
    );

    test(
      "Emit generic exception error in fetch data",
      () async {
        when(
          () => getTrendingUseCase(),
        ).thenAnswer((_) async => Mocks.trendingEntityMock);
        when(
          () => getPopularUseCase(),
        ).thenAnswer((_) async => Mocks.popularEntityMock);
        when(
          () => getTrailersUseCase(),
        ).thenThrow(
          Exception(),
        );

        await sut.initialFetchData();

        expect(store.state, StoreState.error);
        expect(store.exception, isA<Exception>());
      },
    );
  });

  group("searchByText", () {
    test(
      "Should call search by text with success",
      () async {
        when(
          () => searchUseCase(
            page: any(named: "page"),
            text: any(named: "text"),
          ),
        ).thenAnswer((_) async => [Mocks.mediaProductEntityMock]);

        await sut.searchByText("text");

        expect(store.state, StoreState.completed);
        expect(store.searchData, isA<List<MediaProductEntity>>());
        expect(store.searchData!.length, equals(1));
        expect(store.searchData!.first.id, Mocks.mediaProductEntityMock.id);
        expect(
            store.searchData!.first.title, Mocks.mediaProductEntityMock.title);
      },
    );

    test(
      "Failure search by text",
      () async {
        when(
          () => searchUseCase(
            page: any(named: "page"),
            text: any(named: "text"),
          ),
        ).thenThrow(
          FailureRepository(message: "message"),
        );

        await sut.searchByText("text");

        expect(store.state, StoreState.error);
        expect(store.error, equals("message"));
        expect(store.exception, isA<FailureRepository>());
      },
    );

    test(
      "Emit generic exception error in search by text",
      () async {
        store.searchData = [];

        when(
          () => searchUseCase(
            page: any(named: "page"),
            text: any(named: "text"),
          ),
        ).thenThrow(
          Exception(),
        );

        await sut.searchByText("text");

        expect(store.state, StoreState.error);
        expect(store.exception, isA<Exception>());
      },
    );
  });

  group("aditionalSearch", () {
    test(
      "Should call aditional fetch to search with success",
      () async {
        store.searchData = [
          Mocks.mediaProductEntityMock,
          Mocks.mediaProductEntityMock
        ];

        when(
          () => searchUseCase(
            page: any(named: "page"),
            text: any(named: "text"),
          ),
        ).thenAnswer((_) async => [Mocks.mediaProductEntityMock]);

        await sut.aditionalSearch();

        expect(store.state, StoreState.completed);
        expect(store.searchData, isA<List<MediaProductEntity>>());
        expect(store.searchData!.length, equals(3));
        expect(store.searchData!.first.id, Mocks.mediaProductEntityMock.id);
        expect(
            store.searchData!.first.title, Mocks.mediaProductEntityMock.title);
      },
    );

    test(
      "Failure aditional fetch search by text",
      () async {
        store.searchData = [];
        when(
          () => searchUseCase(
            page: any(named: "page"),
            text: any(named: "text"),
          ),
        ).thenThrow(
          FailureRepository(message: "message"),
        );

        await sut.aditionalSearch();

        expect(store.state, StoreState.error);
        expect(store.error, equals("message"));
        expect(store.exception, isA<FailureRepository>());
      },
    );

    test(
      "Emit generic exception error in aditional search by text",
      () async {
        store.searchData = [];

        when(
          () => searchUseCase(
            page: any(named: "page"),
            text: any(named: "text"),
          ),
        ).thenThrow(
          Exception(),
        );

        await sut.aditionalSearch();

        expect(store.state, StoreState.error);
        expect(store.exception, isA<Exception>());
      },
    );
  });

  group("onChangedSearchText", () {
    test(
      "Should clean all data search",
      () async {
        store.indexPageSearch = 2;
        store.searchText = "text";
        store.searchData = [Mocks.mediaProductEntityMock];

        sut.onChangedSearchText("");

        expect(store.indexPageSearch, 1);
        expect(store.searchText.isEmpty, true);
        expect(store.searchData, null);
      },
    );

    test(
      "Should change searchText store",
      () async {
        sut.onChangedSearchText("New Text");

        expect(store.searchText, "New Text");
      },
    );
  });
}
