import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_pilar/app/commons/commons.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

class HomeStore extends StateStore<List<MediaProductEntity>> {
  final Rx<TrendingEntity> _trending = Rx<TrendingEntity>(fakeTrendingLoading);
  TrendingEntity get trending => _trending.value;
  set trending(TrendingEntity value) => _trending.value = value;

  final Rx<PopularEntity> _popular = Rx<PopularEntity>(fakePopularLoading);
  PopularEntity get popular => _popular.value;
  set popular(PopularEntity value) => _popular.value = value;

  final Rx<List<MediaProductEntity>> _trailers =
      Rx<List<MediaProductEntity>>(fakeListLoading);
  List<MediaProductEntity> get trailers => _trailers.value;
  set trailers(List<MediaProductEntity> value) => _trailers.value = value;

  final Rx<List<MediaProductEntity>?> _searchData =
      Rx<List<MediaProductEntity>?>(null);
  List<MediaProductEntity>? get searchData => _searchData.value;
  set searchData(List<MediaProductEntity>? value) => _searchData.value = value;

  final Rx<String> _searchText = Rx<String>('');
  String get searchText => _searchText.value;
  set searchText(String value) => _searchText.value = value;

  int indexPageSearch = 1;

  bool get hasSearchData => searchData != null;

  TrendingEntity get dataTrending =>
      state == StoreState.loading ? fakeTrendingLoading : trending;

  List<MediaProductEntity> get dataTrailers => state == StoreState.loading
      ? fakeListLoading
      : trailers
          .where(
              (element) => element.details?.videos.results.isNotEmpty ?? false)
          .toList();

  PopularEntity get dataPopular =>
      state == StoreState.loading ? fakePopularLoading : popular;

  static MediaProductEntity mediaProductFakeLoading = MediaProductEntity(
    id: 0,
    genreIds: const [],
    adult: false,
    backdropPath: "",
    overview: "",
    popularity: 0,
    posterPath: "",
    releaseDate: DateTime.now(),
    title: "",
    voteAverage: 0,
    voteCount: 0,
    isLoading: true,
    backgroundColor: Colors.black,
    ligthColor: Colors.white,
  );

  static List<MediaProductEntity> get fakeListLoading =>
      List.generate(10, (_) => mediaProductFakeLoading);

  static TrendingEntity fakeTrendingLoading = TrendingEntity(
    day: fakeListLoading,
    week: fakeListLoading,
  );

  static PopularEntity fakePopularLoading = PopularEntity(
    movies: fakeListLoading,
    series: fakeListLoading,
  );
}
