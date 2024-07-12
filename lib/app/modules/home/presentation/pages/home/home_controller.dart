import 'package:flutter/material.dart';
import 'package:teste_pilar/app/commons/commons.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

class HomeController {
  final HomeStore store;
  final GetTrendingUseCase getTrendingUseCase;
  final GetPopularUseCase getPopularUseCase;
  final GetTrailersUseCase getTrailersUseCase;
  final SearchUseCase searchUseCase;
  final UiHelper uiHelper;

  HomeController({
    required this.store,
    required this.getTrendingUseCase,
    required this.getPopularUseCase,
    required this.getTrailersUseCase,
    required this.searchUseCase,
    required this.uiHelper,
  });

  final scroll = ScrollController();

  Future<void> initialFetchData() async {
    store.state = StoreState.loading;

    try {
      final data = await Future.wait([
        getTrendingUseCase(),
        getPopularUseCase(),
        getTrailersUseCase(),
      ]);

      store.trending = data[0] as TrendingEntity;
      store.popular = data[1] as PopularEntity;
      store.trailers = data[2] as List<MediaProductEntity>;
      store.state = StoreState.completed;
    } on Failure catch (failure) {
      if (failure is FailureConnection) {
        uiHelper.showSnackBar(failure.message);
        return;
      }
      store.state = StoreState.error;
      store.exception = failure;
      store.error = failure.message;
    } catch (e) {
      store.state = StoreState.error;
      store.exception = e as Exception;
    }
  }

  Future<void> searchByText(text) async {
    store.indexPageSearch = 1;

    try {
      store.searchData = HomeStore.fakeListLoading;
      final searchData = await searchUseCase(text: text);
      store.searchData = searchData;
    } on Failure catch (failure) {
      if (failure is FailureConnection) {
        uiHelper.showSnackBar(failure.message);
        return;
      }

      store.state = StoreState.error;
      store.exception = failure;
      store.error = failure.message;
    } catch (e) {
      store.state = StoreState.error;
      store.exception = e as Exception;
    }
  }

  Future<void> aditionalSearch() async {
    store.indexPageSearch++;
    final originalList = store.searchData;

    store.searchData = [...store.searchData!, ...HomeStore.fakeListLoading];
    store.state = StoreState.itensLoading;

    try {
      final newItems = await searchUseCase(
        page: store.indexPageSearch,
        text: store.searchText,
      );

      store.searchData = [...originalList!, ...newItems];
      store.state = StoreState.completed;
    } on Failure catch (failure) {
      if (failure is FailureConnection) {
        uiHelper.showSnackBar(failure.message);
        return;
      }

      store.state = StoreState.error;
      store.exception = failure;
      store.error = failure.message;
    } catch (e) {
      store.state = StoreState.error;
      store.exception = e as Exception;
    }
  }

  onChangedSearchText(String text) {
    store.searchText = text;
    if (text.isEmpty) {
      cleanSearch();
    } else {
      store.searchText = text;
    }
  }

  void cleanSearch() {
    store.indexPageSearch = 1;
    store.searchText = '';
    store.searchData = null;
    store.error = null;
    store.exception = null;

    if (scroll.hasClients) {
      scroll.jumpTo(0);
    }
  }
}
