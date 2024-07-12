import 'package:teste_pilar/app/commons/domain/domain.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

class DetailsController {
  final DetailsStore store;
  final GetDetailsUseCase getDetailsUseCase;

  DetailsController({
    required this.store,
    required this.getDetailsUseCase,
  });

  Future<void> fetchDetails(MediaProductEntity mediaProduct) async {
    try {
      store.state = StoreState.loading;
      final details = await getDetailsUseCase(
        id: mediaProduct.id,
        type: mediaProduct.mediaType ?? "movie",
      );
      store.mediaProduct = mediaProduct.copyWith(details: details);
      store.state = StoreState.completed;
    } on Failure catch (e) {
      store.state = StoreState.error;
      store.exception = e;
      store.error = e.message;
    } catch (e) {
      store.state = StoreState.error;
      store.exception = e as Exception;
    }
  }
}
