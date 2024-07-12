import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:teste_pilar/app/commons/commons.dart';
import 'package:teste_pilar/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addInstance(Connectivity());
    i.add<ConnectionService>(ConnectionServiceImpl.new);
    i.add<HttpService>(HttpServiceImpl.new);
    i.add<UiHelper>(UiHelperImpl.new);
  }

  @override
  void routes(r) {
    r.module(
      '/',
      module: HomeModule(),
    );
  }
}
