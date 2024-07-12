import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:teste_pilar/app/commons/commons.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

class DetailsStore extends StateStore<List<MediaProductEntity>> {
  final Rx<MediaProductEntity?> _mediaProduct = Rx<MediaProductEntity?>(null);
  MediaProductEntity? get mediaProduct => _mediaProduct.value;
  set mediaProduct(MediaProductEntity? value) => _mediaProduct.value = value;
}
