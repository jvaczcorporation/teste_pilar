import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_pilar/app/commons/commons.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

import '../../../../../mocks/mocks.dart';

class TheMovieDatasourceSpy extends Mock implements TheMovieDatasource {}

void main() async {
  await dotenv.load(fileName: ".env");

  late TheMovieDatasource datasource;
  late MediaProductRepository sut;

  setUp(() {
    datasource = TheMovieDatasourceSpy();
    sut = MediaProductRepositoryImpl(
      datasource: datasource,
    );
  });

  group("getDetails", () {
    test(
      "Should call get data details with success",
      () async {
        when(
          () => datasource.getDetailsRemote(
              id: any(named: "id"), type: any(named: "type")),
        ).thenAnswer((_) async => Mocks.detailsModelMock);

        final result = await sut.getDetails(id: 1, type: "movie");

        expect(result, isA<DetailsEntity>());
        expect(result.tagline, Mocks.detailsModelMock.tagline);
        expect(result.genres.length, Mocks.detailsModelMock.genres.length);
      },
    );

    test(
      "Should failure repository get data details datasource",
      () async {
        when(
          () => datasource.getDetailsRemote(
              id: any(named: "id"), type: any(named: "type")),
        ).thenThrow(
          FailureRepository(message: ""),
        );

        final result = sut.getDetails(id: 1, type: "movie");

        expect(result, throwsA(isA<FailureRepository>()));
      },
    );
  });

  group("getTrending", () {
    test(
      "Should call get data treading with success",
      () async {
        when(
          () => datasource.getTrendingRemote(page: any(named: "page")),
        ).thenAnswer((_) async => Mocks.trendingModelMock);

        final result = await sut.getTrending(page: 1);

        expect(result, isA<TrendingEntity>());
        expect(result.day.length, Mocks.trendingModelMock.day.length);
        expect(result.day.first.title, Mocks.trendingModelMock.day.first.title);
        expect(result.week.length, Mocks.trendingModelMock.week.length);
        expect(
            result.week.first.title, Mocks.trendingModelMock.week.first.title);
      },
    );

    test(
      "Should failure repository get data trending datasource",
      () async {
        when(
          () => datasource.getTrendingRemote(page: any(named: "page")),
        ).thenThrow(
          FailureRepository(message: ""),
        );

        final result = sut.getTrending(page: 1);

        expect(result, throwsA(isA<FailureRepository>()));
      },
    );
  });

  group("getPopular", () {
    test(
      "Should call get data popular with success",
      () async {
        when(
          () => datasource.getPopularRemote(page: any(named: "page")),
        ).thenAnswer((_) async => Mocks.popularModelMock);

        final result = await sut.getPopular(page: 1);

        expect(result, isA<PopularEntity>());
        expect(result.movies.length, Mocks.trendingModelMock.day.length);
        expect(
            result.movies.first.title, Mocks.trendingModelMock.day.first.title);
        expect(result.series.length, Mocks.trendingModelMock.week.length);
        expect(result.series.first.title,
            Mocks.trendingModelMock.week.first.title);
      },
    );

    test(
      "Should failure repository get data popular datasource",
      () async {
        when(
          () => datasource.getPopularRemote(page: any(named: "page")),
        ).thenThrow(
          FailureRepository(message: ""),
        );

        final result = sut.getPopular(page: 1);

        expect(result, throwsA(isA<FailureRepository>()));
      },
    );
  });

  group("search", () {
    test(
      "Should call search with success",
      () async {
        when(
          () => datasource.searchRemote(
              text: any(named: "text"), page: any(named: "page")),
        ).thenAnswer((_) async => [Mocks.mediaProductModelMock]);

        final result = await sut.search(text: "text", page: 1);

        expect(result, isA<List<MediaProductEntity>>());
        expect(result.length, 1);
        expect(result.first.title, Mocks.mediaProductModelMock.title);
      },
    );

    test(
      "Should failure repository search datasource",
      () async {
        when(
          () => datasource.searchRemote(
              text: any(named: "text"), page: any(named: "page")),
        ).thenThrow(
          FailureRepository(message: ""),
        );

        final result = sut.search(
          text: "text",
          page: 1,
        );

        expect(result, throwsA(isA<FailureRepository>()));
      },
    );
  });

  group("getTrailers", () {
    test(
      "Should call get data upcomings to trailers with success",
      () async {
        when(
          () => datasource.getUpcomingsRemote(page: any(named: "page")),
        ).thenAnswer((_) async => [Mocks.mediaProductModelMock]);
        when(
          () => datasource.getDetailsRemote(
            id: any(named: "id"),
            type: any(named: "type"),
          ),
        ).thenAnswer((_) async => Mocks.detailsModelMock);

        final result = await sut.getTrailers(page: 1);

        expect(result, isA<List<MediaProductEntity>>());
        expect(result.length, 1);
        expect(result.first.title, Mocks.mediaProductModelMock.title);
      },
    );

    test(
      "Should failure repository get data upcomings to trailers datasource",
      () async {
        when(
          () => datasource.getUpcomingsRemote(page: any(named: "page")),
        ).thenThrow(
          FailureRepository(message: ""),
        );

        final result = sut.getTrailers(page: 1);

        expect(result, throwsA(isA<FailureRepository>()));
      },
    );
  });
}
