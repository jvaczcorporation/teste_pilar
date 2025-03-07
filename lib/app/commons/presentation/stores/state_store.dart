import 'package:teste_pilar/app/commons/domain/enums/store_state.dart';
import 'package:get/get.dart';

abstract class StateStore<T> {
  final Rx<StoreState> _state = Rx<StoreState>(StoreState.completed);
  final Rx<String?> _error = Rx<String?>(null);
  final Rx<Exception?> _exception = Rx<Exception?>(null);

  StoreState get state => _state.value;
  Rx<String?> get errorRx => _error;
  String? get error => _error.value;
  bool get hasException => _exception.value != null;
  Exception? get exception => _exception.value;

  set state(StoreState value) => _state.value = value;
  set error(String? value) => _error.value = value;
  set exception(Exception? value) => _exception.value = value;

  bool get isLoading => state == StoreState.loading;
  bool get hasError =>
      _exception.value != null || (error != null && error!.isNotEmpty);
}
