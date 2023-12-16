import 'package:get/get.dart';
import 'controller/pesanan_controller.dart';
import 'controller/pewangi_controller.dart';

class SampleBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PesananController>(() => PesananController());
    Get.lazyPut<PewangiController>(() => PewangiController());
  }
}
