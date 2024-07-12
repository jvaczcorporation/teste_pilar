import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_pilar/app/commons/domain/erros/errors.dart';
import 'package:teste_pilar/app/commons/services/http_service.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

import '../../../../../mocks/mocks.dart';

class HttpServiceSpy extends Mock implements HttpService {}

void main() async {
  await dotenv.load(fileName: ".env");

  late HttpService httpService;
  late TheMovieDatasource sut;

  setUp(() {
    httpService = HttpServiceSpy();
    sut = TheMovieDatasourceImpl(
      httpService: httpService,
    );
  });

  group("getDetailsRemote", () {
    test(
      "Should call get details data with success",
      () async {
        when(
          () => httpService.get(any()),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(
              path: "path",
            ),
            statusCode: 200,
            data: Mocks.detailsToJsonMock,
          ),
        );

        final result = await sut.getDetailsRemote(id: 1, type: "movie");

        expect(result, isA<DetailsModel>());
      },
    );
    test(
      "Should emit failure to get details datasource remote",
      () async {
        when(
          () => httpService.get(any()),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(
              path: "path",
            ),
            statusCode: 502,
            data: Mocks.detailsToJsonMock,
          ),
        );

        final result = sut.getDetailsRemote(id: 1, type: "movie");

        expect(result, throwsA(isA<FailureDatasource>()));
      },
    );
  });

  group("getTrendingRemote", () {
    test(
      "Should call get trending data with success",
      () async {
        when(
          () => httpService.get(any()),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(
              path: "path",
            ),
            statusCode: 200,
            data: Mocks.treadingToJsonMock,
          ),
        );

        final result = await sut.getTrendingRemote(page: 1);

        expect(result, isA<TrendingModel>());
      },
    );
    test(
      "Should emit failure datasource to get trending remote",
      () async {
        when(
          () => httpService.get(any()),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(
              path: "path",
            ),
            statusCode: 502,
            data: Mocks.treadingToJsonMock,
          ),
        );

        final result = sut.getTrendingRemote(page: 1);

        expect(result, throwsA(isA<FailureDatasource>()));
      },
    );
  });

  group("getPopularRemote", () {
    test(
      "Should call get popular data with success",
      () async {
        when(
          () => httpService.get(any()),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(
              path: "path",
            ),
            statusCode: 200,
            data: Mocks.popularToJsonMock,
          ),
        );

        final result = await sut.getPopularRemote(page: 1);

        expect(result, isA<PopularModel>());
      },
    );
    test(
      "Should emit failure to get popular datasource remote",
      () async {
        when(
          () => httpService.get(any()),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(
              path: "path",
            ),
            statusCode: 502,
            data: Mocks.popularToJsonMock,
          ),
        );

        final result = sut.getTrendingRemote(page: 1);

        expect(result, throwsA(isA<FailureDatasource>()));
      },
    );
  });

  group("searchRemote", () {
    test(
      "Should call search data with success",
      () async {
        when(
          () => httpService.get(any()),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(
              path: "path",
            ),
            statusCode: 200,
            data: Mocks.searchToJsonMock,
          ),
        );

        final result = await sut.searchRemote(text: "text", page: 1);

        expect(result, isA<List<MediaProductModel>>());
      },
    );
    test(
      "Should emit failure to search datasource remote",
      () async {
        when(
          () => httpService.get(any()),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(
              path: "path",
            ),
            statusCode: 502,
            data: Mocks.searchToJsonMock,
          ),
        );

        final result = sut.searchRemote(text: "text", page: 1);

        expect(result, throwsA(isA<FailureDatasource>()));
      },
    );
  });

  group("getUpcomingsRemote", () {
    test(
      "Should call get upcomings data with success",
      () async {
        when(
          () => httpService.get(any()),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(
              path: "path",
            ),
            statusCode: 200,
            data: Mocks.upcomingsToJsonMock,
          ),
        );

        final result = await sut.getUpcomingsRemote(page: 1);

        expect(result, isA<List<MediaProductModel>>());
      },
    );
    test(
      "Should emit failure to search datasource remote",
      () async {
        when(
          () => httpService.get(any()),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(
              path: "path",
            ),
            statusCode: 502,
            data: Mocks.upcomingsToJsonMock,
          ),
        );

        final result = sut.getUpcomingsRemote(page: 1);

        expect(result, throwsA(isA<FailureDatasource>()));
      },
    );
  });
}
