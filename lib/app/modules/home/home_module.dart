import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_pilar/app/app_module.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.add<TheMovieDatasource>(TheMovieDatasourceImpl.new);
    i.add<MediaProductRepository>(MediaProductRepositoryImpl.new);
    i.add<GetTrendingUseCase>(GetTrendingUseCaseImpl.new);
    i.add<GetPopularUseCase>(GetPopularUseCaseImpl.new);
    i.add<SearchUseCase>(SearchUseCaseImpl.new);
    i.add<GetTrailersUseCase>(GetTrailersUseCaseImpl.new);
    i.add<GetDetailsUseCase>(GetDetailsUseCaseImpl.new);
    i.addSingleton(HomeStore.new);
    i.add(DetailsStore.new);
    i.add(HomeController.new);
    i.add(DetailsController.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const HomePage(),
      transition: TransitionType.noTransition,
    );
    r.child(
      '/details',
      child: (context) => DetailPage(
        mediaProduct: r.args.data as MediaProductEntity,
      ),
      transition: TransitionType.noTransition,
    );
  }

  @override
  List<Module> get imports => [AppModule()];
}
